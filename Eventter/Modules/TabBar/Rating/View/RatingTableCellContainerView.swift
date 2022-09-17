//
//  RatingTableCellContainerView.swift
//  Eventter
//
//  Created by Чингиз Саткан on 04.09.2022.
//

import Foundation
import UIKit

class RatingTableCellContainerView: BaseView {
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo.circle.fill")
        return image
    }()
    
    let standingLabel: UILabel = {
        let standing = UILabel()
        return standing
    }()
    
    let pointsLabel: UILabel = {
        let points = UILabel()
        return points
    }()
    
    func configure(with viewModel: ViewModel) {
        nicknameLabel.text = viewModel.nickname
        standingLabel.text = String(viewModel.standing)
        pointsLabel.text = String(viewModel.points)
    }
    
    func reset() {
        nicknameLabel.text = nil
        standingLabel.text = nil
        pointsLabel.text = nil
    }
    
    override func setView() {
        addSubviews(nicknameLabel, standingLabel, pointsLabel, imageView)

        standingLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(standingLabel.snp.right).offset(10)
            make.bottom.equalToSuperview().offset(-16)
            make.height.width.equalTo(40)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(5)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.left.equalTo(nicknameLabel.snp.right)
            make.top.equalToSuperview().offset(16)
            make.right.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension RatingTableCellContainerView {
    struct ViewModel {
        var standing: Int
        var nickname: String
        var points: Int
    }
}
