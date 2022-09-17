//
//  LoginVC.swift
//  Eventter
//
//  Created by Чингиз Саткан on 12.09.2022.
//

import UIKit

class LoginVC: BaseViewController {
    
    let logoView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(systemName: "app.fill")
        return logo
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Sign in to StreakCode"
        return label
    }()
    
    let usernameField: UITextField = {
        let username = UITextField()
        username.placeholder = "Username or email address"
        username.borderStyle = .roundedRect
        username.addShadow()
        return username
    }()
    
    let passwordField: UITextField = {
        let password = UITextField()
        password.placeholder = "Enter password"
        password.borderStyle = .roundedRect
        password.addShadow()
        return password
    }()
    
    let loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Log In", for: .normal)
        login.setTitleColor(.systemBlue, for: .normal)
        login.backgroundColor = .white
        login.addShadow()
        return login
    }()
    
    let forgotButton: UIButton = {
        let forgot = UIButton()
        forgot.setTitle("forgot password?", for: .normal)
        forgot.setTitleColor(.systemBlue, for: .normal)
        return forgot
    }()
    
    let orLabel: UILabel = {
        let or = UILabel()
        or.text = "Or"
        return or
    }()
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.addShadow()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setView() {
        super.setView()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.addArrangedSubviews(usernameField, passwordField)
        
        contentView.addSubviews(logoView, label, stackView, forgotButton, loginButton, orLabel, signupButton)
        
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(180)
            make.width.height.equalTo(90)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(5)
            make.right.equalToSuperview().offset(-16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotButton.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
        
        orLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(45)
            make.bottom.equalToSuperview()
        }
        
        passwordField.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
}
