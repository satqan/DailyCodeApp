//
//  SettingsPropertiesView.swift
//  Eventter
//
//  Created by Чингиз Саткан on 11.09.2022.
//

import UIKit

class TextFieldWithTitleCell: BaseTableViewCell {
    
    var didTapChangePassword: (() -> Void)?

    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let textfield: UITextField = {
        let placeholder = UITextField()
        placeholder.borderStyle = .roundedRect
        return placeholder
    }()
    
    func configure(with title: String, placeholder: String? = nil) {
        titleLabel.text = title
        textfield.placeholder = placeholder
    }
    
    @objc private func didTapChangePasswordHandler() {
        didTapChangePassword?()
    }
    override func setView() {
        super.setView()
        
        contentView.addSubviews(titleLabel, textfield)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview()
        }
        
        textfield.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
