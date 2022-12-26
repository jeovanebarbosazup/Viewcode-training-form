//
//  Viewcode.swift
//  ex 4.2 Viewcode-training-form
//
//  Created by jeovane.barbosa on 26/12/22.
//

import Foundation

protocol Viewcode {
    
    func setupViews()
    
    func buildHierarchies()
    
    func setupConstraints()
    
    func applyAdditionalChanges()
    

}

extension Viewcode {
    func setupViews() {
        buildHierarchies()
        setupConstraints()
        applyAdditionalChanges()
    }
}
