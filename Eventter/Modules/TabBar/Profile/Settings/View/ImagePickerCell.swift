//
//  ImagePickerCell.swift
//  Eventter
//
//  Created by Zhussupali Salamat on 14.09.2022.
//

import UIKit

class ImagePickerCell: BaseTableViewCell {
    
    var didTapChangePhoto: (()->Void)?
    
    private let imageWidth: CGFloat = 160
    private(set) lazy var pickerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageWidth / 2
        return imageView
    }()
    
    let changeButton: UIButton = {
       let button = UIButton()
        button.setTitle("Change profile photo", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapChangePhotoHandler), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapChangePhotoHandler() {
        didTapChangePhoto?()
    }
    
    func configure(image: UIImage?) {
        pickerImageView.image = image
    }
    
    override func setView() {
        contentView.addSubviews(pickerImageView, changeButton)
        
        pickerImageView.snp.makeConstraints { make in
            make.height.width.equalTo(imageWidth)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        changeButton.snp.makeConstraints { make in
            make.top.equalTo(pickerImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
