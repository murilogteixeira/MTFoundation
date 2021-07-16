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
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    // MARK: Initializers
    private init() {
        super.init(frame: .zero)
        setupViewCode()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: Methods
    public static func add(in view: UIView) {
        let loader = Loader()
        view.addSubview(loader)
        loader.pinEdge.to(view)
    }
}

// MARK: ViewCode
extension Loader: ViewCode {
    public func setupHierarchy() {
        addSubview(activityIndicator)
    }

    public func setupConstraints() {
        activityIndicator.pinCenter.to(self)
    }

    public func setupAdditionalConfiguration() {
        backgroundColor = .black.withAlphaComponent(0.5)
    }
}
