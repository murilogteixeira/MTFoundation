//
//  ViewCode.swift
//  
//
//  Created by Murilo Teixeira on 19/06/21.
//

protocol ViewCode {
    func setupViewCode()
    func setupHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCode {
    func setupViewCode() {
        setupHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}
