//
//  File.swift
//  
//
//  Created by Murilo Teixeira on 16/07/21.
//

import UIKit

public class Loader: UIView {

    // MARK: Attributes

    // MARK: Components
    public let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    public let activityIndicatorView = UIView(backgroundColor: .white.withAlphaComponent(0.2))

    // MARK: Initializers
    public init() {
        super.init(frame: .zero)
        setupViewCode()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: Methods
    public static func add(_ loader: Loader, in view: UIView) {
        view.addSubview(loader)
        loader.pinEdge.to(view)
    }

    public static func remove(from view: UIView) {
        guard let loader = view.subviews.first(where: { $0 is Loader }) else { return }
        loader.removeFromSuperview()
    }
}

// MARK: ViewCode
extension Loader: ViewCode {
    public func setupHierarchy() {
        addSubview(activityIndicatorView)
        activityIndicatorView.addSubview(activityIndicator)
    }

    public func setupConstraints() {
        activityIndicatorView.pinCenter.to(self)
        activityIndicatorView.pinWidth.constant(50)
        activityIndicatorView.pinHeight.to(activityIndicatorView, location: .width)

        activityIndicator.pinCenter.to(activityIndicatorView)
    }

    public func setupAdditionalConfiguration() {
        backgroundColor = .black.withAlphaComponent(0.5)
        activityIndicatorView.cornerRadius(8)
    }
}
