//
//  YouTubePlayer.swift
//  
//
//  Created by Murilo Teixeira on 13/07/21.
//
//  YouTube iFrame API documentation:
//  https://developers.google.com/youtube/iframe_api_reference?hl=pt-br

import UIKit
import WebKit
import MTAutoLayoutKit

public protocol PlayerDelegate: AnyObject {
    func player(_ player: YouTubePlayer, stateDidChanged state: YouTubePlayer.PlayerState)
    func player(_ player: YouTubePlayer, anErrorOcurred error: Error)
    func player(_ player: YouTubePlayer, timeDidChanged time: Int)
    func player(_ player: YouTubePlayer, videoDurationDidLoaded duration: Int)
    func playerIsReady(_ player: YouTubePlayer)
    func playerDidEnterFullScreen(_ player: YouTubePlayer)
    func playerDidExitFullScreen(_ player: YouTubePlayer)
}

public extension PlayerDelegate {
    func player(_ player: YouTubePlayer, stateDidChanged state: YouTubePlayer.PlayerState) { }
    func player(_ player: YouTubePlayer, anErrorOcurred error: Error) { }
    func player(_ player: YouTubePlayer, timeDidChanged time: Int) { }
    func player(_ player: YouTubePlayer, videoDurationDidLoaded duration: Int) { }
    func playerIsReady(_ player: YouTubePlayer) { }
    func playerDidEnterFullScreen(_ player: YouTubePlayer) { }
    func playerDidExitFullScreen(_ player: YouTubePlayer) { }
}

public class YouTubePlayer: UIView {
    
    // MARK: FileError
    enum FileError: Error, LocalizedError {
        case fileNotFound(String)
        
        var errorDescription: String? {
            switch self {
            case .fileNotFound(let file): return "Arquivo '\(file)' não encontrado"
            }
        }
    }
    
    // MARK: PlayerNotification
    enum PlayerNotification: String, CaseIterable {
        case onReady, state, currentTime, error
        
        init?(_ value: String) {
            self.init(rawValue: value)
        }
    }
    
    // MARK: PlayerState
    public enum PlayerState: Equatable {
        case initial, unstarted, ended, playing, paused, buffering, cued, unkowed
        
        init(_ value: Int?) {
            switch value {
            case -1: self = .unstarted
            case 0: self = .ended
            case 1: self = .playing
            case 2: self = .paused
            case 3: self = .buffering
            case 5: self = .cued
            default: self = .unkowed
            }
        }
    }
    
    // MARK: PlayerErrorState
    public enum PlayerErrorState: Error, LocalizedError {
        case initial, invalidParameter, playerError, videoNotFound, ownerBlocked, unkowed
        
        public var errorDescription: String? {
            switch self {
            case .invalidParameter: return "O endereço do vídeo é inválido."
            case .playerError, .ownerBlocked: return "O vídeo não pôde ser reproduzido."
            case .videoNotFound: return " O vídeo não foi encontrado."
            case .initial: return ""
            default: return "Erro desconhecido."
            }
        }
        
        init(_ value: Int?) {
            switch value {
            case 2: self = .invalidParameter
            case 5: self = .playerError
            case 100: self = .videoNotFound
            case 101, 150: self = .ownerBlocked
            default: self = .unkowed
            }
        }
    }
    
    // MARK: PlayerVariables
    public enum PlayerVariables: String, CaseIterable {
        case playsInline = "playsinline"
        case related = "rel"
        case showInfo = "showinfo"
        case controls = "controls"
    }
    
    // MARK: Attributes
    private(set) var currentTime: Int = 0
    public var playVideoWhenReady = false
    public var playerVariables: [PlayerVariables] = [.controls, .showInfo]
    
    public weak var delegate: PlayerDelegate?
    
    private var playerVariablesJson: String {
        let playerVars: [String: Int] = PlayerVariables.allCases.reduce([:]) {
            var newDict = $0
            newDict.merge([$1.rawValue: playerVariables.contains($1) ? 1 : 0]) { (_, new) in new }
            return newDict
        }
        guard let jsonData = try? JSONEncoder().encode(playerVars),
              let json = String(data: jsonData, encoding: .utf8)
        else { return "{}" }
        return json
    }
    
    // MARK: Components
    private lazy var playerView: WKWebView = {
        let userContentController = WKUserContentController()
        PlayerNotification.allCases.forEach {
            userContentController.add(self, name: $0.rawValue)
        }
        
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        config.userContentController = userContentController
        config.allowsPictureInPictureMediaPlayback
        
        let view = WKWebView(frame: .zero, configuration: config)
        view.scrollView.isScrollEnabled = false
        view.isOpaque = false
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: Initializers
    public init() {
        super.init(frame: .zero)
        
        setupViewCode()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playerDidExitFullScreen),
            name: UIWindow.didBecomeHiddenNotification, object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playerDidEnterFullScreen),
            name: UIWindow.didBecomeVisibleNotification, object: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Player Methods
    public func load(videoBy url: URL, playerVariables: [PlayerVariables]? = nil) {
        guard let videoID = getYoutubeID(from: url) else {
            delegate?.player(self, anErrorOcurred: PlayerErrorState.invalidParameter)
            return
        }
        load(videoBy: videoID, playerVariables: playerVariables)
    }
    
    public func load(videoBy videoID: String, playerVariables: [PlayerVariables]? = nil) {
        
        do {
            if let playerVars = playerVariables { self.playerVariables = playerVars }
            var html = try getHTMLContent()
            html = setup(html, videoID: videoID, playerVars: playerVariablesJson)
            playerView.loadHTMLString(html, baseURL: nil)
        } catch {
            delegate?.player(self, anErrorOcurred: error)
        }
    }
    
    public func playVideo() {
        playerView.evaluateJavaScript("player.playVideo();")
    }
    
    public func pauseVideo() {
        playerView.evaluateJavaScript("player.pauseVideo();")
    }
    
    public func stopVideo() {
        playerView.evaluateJavaScript("player.stopVideo();")
        currentTime = 0
        delegate?.player(self, timeDidChanged: currentTime)
    }
    
    private func getDuration(completion: @escaping (Int?) -> Void) {
        playerView.evaluateJavaScript("player.getDuration();") { result, _ in
            completion(result as? Int)
        }
    }
    
    public func setCurrentTime(to value: Int) {
        playerView.evaluateJavaScript("player.seekTo(\(value), true);")
    }
    
    public func mutePlayer(_ value: Bool) {
        if value {
            playerView.evaluateJavaScript("player.mute();")
        } else {
            playerView.evaluateJavaScript("player.unMute();")
        }
    }
    
    private func clearVideo() {
        playerView.evaluateJavaScript("player.clearVideo();")
    }
    
    public func cleanPlayer() {
        stopVideo()
        clearVideo()
        PlayerNotification.allCases.forEach {
            playerView.configuration.userContentController.removeScriptMessageHandler(forName: $0.rawValue)
        }
    }
    
    // MARK: Methods
    private func getYoutubeID(from url: URL) -> String? {
        let url = url.path
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"

        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: url.count)

        guard let result = regex?.firstMatch(in: url, range: range) else {
            return nil
        }
        
        return (url as NSString).substring(with: result.range)
    }
    
    private func getHTMLContent() throws -> String {
        let file = "player"
        let type = "html"
        guard let path = Bundle.module.path(forResource: file, ofType: type) else {
            fatalError("File player.html not found")
        }
        
        do {
            return try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            throw FileError.fileNotFound("\(file).\(type)")
        }
    }
    
    private func setup(_ html: String, videoID: String, playerVars: String) -> String {
        var html = html
        html = html.replacingOccurrences(of: "videoId:", with: "videoId: '\(videoID)'")
        html = html.replacingOccurrences(of: "playerVars:", with: "playerVars: \(playerVars)")
        return html
    }
    
    public func isLoading(_ value: Bool) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.playerView.alpha = value ? 0 : 1
//                self?.isLoading = value
            }
        }
    }
    
    private func playerIsReady() {
        if playVideoWhenReady { playVideo() }
        getDuration { [weak self] duration in
            guard let self = self else { return }
            self.delegate?.player(self, videoDurationDidLoaded: duration ?? 0)
        }
    }
    
    @objc private func playerDidEnterFullScreen() {
        delegate?.playerDidEnterFullScreen(self)
    }
    
    @objc private func playerDidExitFullScreen() {
        delegate?.playerDidExitFullScreen(self)
    }
    
}

// MARK: ViewCode
extension YouTubePlayer: ViewCode {
    public func setupHierarchy() {
        addSubview(playerView)
    }
    
    public func setupConstraints() {
        playerView.pinEdge.to(self)
    }
    
    public func setupAdditionalConfiguration() {
        backgroundColor = .black
    }
}

// MARK: WKScriptMessageHandler
extension YouTubePlayer: WKScriptMessageHandler {

    public func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        let notification = PlayerNotification(message.name)
        switch notification {
        case .onReady:
            playerIsReady()
            delegate?.playerIsReady(self)
        case .state:
            delegate?.player(self, stateDidChanged: PlayerState(message.body as? Int))
        case .error:
            delegate?.player(self, anErrorOcurred: PlayerErrorState(message.body as? Int))
        case .currentTime:
            currentTime = Int(message.body as? Double ?? 0)
            delegate?.player(self, timeDidChanged: currentTime)
        default: break
        }
    }

}
