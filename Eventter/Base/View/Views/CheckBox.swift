//
//  CheckBox.swift
//  Eventter
//
//  Created by Чингиз Саткан on 04.09.2022.
//

import UIKit

class CheckBox: UIButton {
    
    let checkedImage = UIImage(systemName: "checkmark.circle")
    let uncheckedImage = UIImage(systemName: "circle")
    
    var isChecked: Bool = false {
        didSet {
            if isChecked {
                setImage(checkedImage, for: .normal)
                
            } else {
                setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
        setImage(isChecked ? checkedImage : uncheckedImage, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTap() {
        isChecked.toggle()
    }
}
