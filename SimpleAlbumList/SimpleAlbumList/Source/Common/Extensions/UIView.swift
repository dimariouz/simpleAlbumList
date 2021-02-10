//
//  UIView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

extension UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func fillSuperview(padding: UIEdgeInsets) {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: padding)
    }
    
    func fillSuperview() {
        fillSuperview(padding: .zero)
    }
    
    func centering(to view: UIView, constantX: CGFloat = 0, constantY: CGFloat = 0) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constantX).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constantY).isActive = true
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func add(subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func roundCorners(radius: CGFloat, maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
        self.clipsToBounds = true
    }
    
    func addShadow(color: UIColor = .black,
                   offset: CGSize = CGSize(width: 0.0, height: 2.0),
                   radius: CGFloat = 4.0,
                   opacity: Float = 0.3) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    func addBorder(color: UIColor = .black,
                   width: CGFloat = 2) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
}
