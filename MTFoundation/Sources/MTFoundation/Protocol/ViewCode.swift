//
//  ViewCode.swift
//  
//
//  Created by Murilo Teixeira on 19/06/21.
//

public protocol ViewCode {
    func setupViewCode()
    func setupHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

public extension ViewCode {
    func setupViewCode() {
        setupHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}
