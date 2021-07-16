//
//  File.swift
//  
//
//  Created by Murilo Teixeira on 16/07/21.
//

import UIKit

class Loader: UIView {

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

    // MARK: Methods
    static func add(in view: UIView) {
        let loader = Loader()
        view.addSubview(loader)
        loader.pinEdge.to(view)
    }
}

// MARK: ViewCode
extension Loader: ViewCode {
    func setupHierarchy() {
        addSubview(activityIndicator)
    }

    func setupConstraints() {
        activityIndicator.pinCenter.to(self)
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .black.withAlphaComponent(0.5)
    }
}
