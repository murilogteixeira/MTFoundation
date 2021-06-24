//
//  UIStackView+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 21/06/21.
//

import UIKit

public extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat,
        alignment: Alignment,
        distribution: Distribution,
        layoutMargins: UIEdgeInsets? = nil
    ) {
        self.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.layoutMargins = layoutMargins ?? .zero
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    func addSpace(
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        backgroundColor: UIColor = .clear
    ) {
        let spaceView = Self.spacerView(height: height, width: width, backgroundColor: backgroundColor)
        addArrangedSubview(spaceView)
    }
    
    func addSpace(_ size: CGFloat) {
        switch self.axis {
        case .vertical: addSpace(height: size)
        case .horizontal: addSpace(width: size)
        default: break
        }
    }
    
    class func spacerView(
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        backgroundColor: UIColor = .clear
    ) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        return view
    }
}
