//
//  File.swift
//  
//
//  Created by Murilo Teixeira on 16/07/21.
//

import UIKit

public class Loader: UIView {

    // MARK: Configuration
    public struct Configuration {
        public var backgroundColor: UIColor
        public var activityIndicatorViewColor: UIColor
        public var activityIndicatorViewSize: CGFloat
        public var activityIndicatorColor: UIColor
        public var activityIndicatorStyle: UIActivityIndicatorView.Style

        public init(
            backgroundColor: UIColor = .clear,
            activityIndicatorViewColor: UIColor = .clear,
            activityIndicatorViewSize: CGFloat = 50,
            activityIndicatorColor: UIColor = .black,
            activityIndicatorStyle: UIActivityIndicatorView.Style = .gray
        ) {
            self.backgroundColor = backgroundColor
            self.activityIndicatorViewColor = activityIndicatorViewColor
            self.activityIndicatorViewSize = activityIndicatorViewSize
            self.activityIndicatorColor = activityIndicatorColor
            self.activityIndicatorStyle = activityIndicatorStyle
        }
    }

    // MARK: Attributes
    public var configuration: Configuration {
        didSet {
            backgroundColor = configuration.backgroundColor
            activityIndicator.color = configuration.activityIndicatorColor
            activityIndicatorView.backgroundColor = configuration.activityIndicatorViewColor
            activityIndicator.style = configuration.activityIndicatorStyle
            activityIndicatorViewSizeConstraint.constant = configuration.activityIndicatorViewSize
        }
    }

    // MARK: Components
    public lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = configuration.activityIndicatorStyle
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    private lazy var activityIndicatorViewSizeConstraint = activityIndicatorView.pinWidth.constant(0, isActive: false)
    public lazy var activityIndicatorView = UIView(backgroundColor: configuration.activityIndicatorViewColor)

    // MARK: Initializers
    public init() {
        configuration = Configuration()
        super.init(frame: .zero)
        setupViewCode()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: Methods
    public static func add(in view: UIView, with configuration: Configuration = .init()) {
        let loader = Loader()
        view.addSubview(loader)
        loader.pinEdge.to(view)
        loader.configuration = configuration
    }

    public static func remove(from view: UIView) {
        DispatchQueue.main.async {
            guard let loader = view.subviews.first(where: { $0 is Self }) else { return }
            loader.removeFromSuperview()
        }
    }
}

// MARK: ViewCode
extension Loader: ViewCode {
    public func setupHierarchy() {
        addSubview(activityIndicatorView)
        addSubview(activityIndicator)
    }

    public func setupConstraints() {
        activityIndicatorView.pinCenter.to(self)
        activityIndicatorViewSizeConstraint.isActive = true
        activityIndicatorView.pinHeight.to(activityIndicatorView, location: .width)

        activityIndicator.pinCenter.to(self)
    }

    public func setupAdditionalConfiguration() {
        backgroundColor = configuration.backgroundColor
        activityIndicatorView.cornerRadius(6)
    }
}
