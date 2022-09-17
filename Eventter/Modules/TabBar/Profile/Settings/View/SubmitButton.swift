//
//  SubmitButton.swift
//  Eventter
//
//  Created by Чингиз Саткан on 16.09.2022.
//

import UIKit

class SubmitButton: BaseTableViewCell {
    
    var didTapSubmitButton: (()->Void)?
    
    private(set) lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.addShadow()
        button.addTarget(self, action: #selector(didTapSubmitButtonHandler), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapSubmitButtonHandler() {
        didTapSubmitButton?()
    }
    
    func configure(with description: String) {
        submitButton.setTitle(description, for: .normal)
    }
    
    override func setView() {
        super.setView()

        contentView.addSubviews(submitButton)
        
        submitButton.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
    }
}


