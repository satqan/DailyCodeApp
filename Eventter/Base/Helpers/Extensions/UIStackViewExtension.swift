//
//  UIStackViewExtension.swift
//  Eventter
//
//  Created by Чингиз Саткан on 06.09.2022.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views : UIView...) -> Void {
        views.forEach { (view) in
            self.addArrangedSubview(view)
        }
    }
}
