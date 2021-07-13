//
//  View.swift
//  UIKitExample
//
//  Created by Murilo Teixeira on 02/07/21.
//

import UIKit
import MTFoundation

class View: UIView {

    let view: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

extension View: ViewCode {
    func setupHierarchy() {
        addSubview(view)
    }
    
    func setupConstraints() {
        view.pinTop.to(self)
        view.pinEdgeX.to(self)
        view.pinBottom.to(self)
    }
}
