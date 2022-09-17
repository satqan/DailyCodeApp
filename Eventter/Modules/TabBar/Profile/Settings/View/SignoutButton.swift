//
//  SubmitButton.swift
//  Eventter
//
//  Created by Чингиз Саткан on 15.09.2022.
//

import UIKit

class SignoutButton: BaseTableViewCell {
    
    var didTapSignoutButton: (()->Void)?
    
    private(set) lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.addShadow()
        button.addTarget(self, action: #selector(didTapSignoutButtonHandler), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapSignoutButtonHandler() {
        didTapSignoutButton?()
    }
    
    func configure(with description: String) {
        button.setTitle(description, for: .normal)
    }
    
    override func setView() {
        super.setView()

        contentView.addSubviews(button)
        
        button.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
    }
}

