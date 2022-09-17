//
//  ProfileContainerView.swift
//  Eventter
//
//  Created by Чингиз Саткан on 06.09.2022.
//

import UIKit

class UserInfoView: BaseView {
    
    var nameLabel: UILabel = {
        let name = UILabel()
        name.font = name.font.withSize(30)
        return name
    }()
    
    let leetcodeUserLabel: UILabel = {
        let username = UILabel()
        username.text = "ssatkan"
        username.font = username.font?.withSize(20)
        return username
    }()
    
    private let imageWidth: CGFloat = 160
    private(set) lazy var imageView: UIImageView = {
        let photo = UIImageView()
        photo.layer.masksToBounds = true
        photo.layer.cornerRadius = imageWidth / 2
        return photo
    }()
    
    func configure(with userModel: UserModel) {
        nameLabel.text = "\(userModel.name) \(userModel.last_name)"
        leetcodeUserLabel.text = userModel.username
        imageView.image = userModel.image
    }
    
    override func setView() {
        super.setView()
        
        addSubviews(nameLabel, leetcodeUserLabel, imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.height.width.equalTo(imageWidth)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        leetcodeUserLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension UserInfoView {
    struct UserModel {
        var name: String?
        var last_name: String?
        var username: String?
        var image: UIImage?
    }
}
