//
//  UIViewExtension.swift
//  Eventter
//
//  Created by Чингиз Саткан on 31.08.2022.
//


import UIKit

extension UIView{
    func addShadow(_ radius: CGFloat = 20.0) {
        layer.cornerRadius = radius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.1
    }
    
    func addSubviews(_ views : UIView...) -> Void {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
}
