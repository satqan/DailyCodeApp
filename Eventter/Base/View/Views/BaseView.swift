//
//  BaseView.swift
//  Eventter
//
//  Created by Чингиз Саткан on 31.08.2022.
//

import UIKit

class BaseView: UIView, ViewConfigurable {
    
    //    MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func setView() { }
}

