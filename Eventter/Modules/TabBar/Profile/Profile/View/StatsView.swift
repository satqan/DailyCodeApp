//
//  StreakContainerView.swift
//  Eventter
//
//  Created by Чингиз Саткан on 07.09.2022.
//

import UIKit

class StatsView: BaseView {
    
    let iconView: UIImageView = {
        let flame = UIImageView()
        return flame
    }()
    
    let statsLabel: UILabel = {
        let streak = UILabel()
        return streak
    }()
    
    let descriptionLabel: UILabel = {
        let description = UILabel()
        return description
    }()
    
    func configure(with statsModel: StatsModel){
        iconView.image = statsModel.icon
        statsLabel.text = String(statsModel.statistics)
        descriptionLabel.text = statsModel.description
    }
    
    override func setView() {
        super.setView()
        
        addSubviews(iconView, statsLabel, descriptionLabel)
        
        iconView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.height.width.equalTo(50)
        }
        
        statsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(iconView.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(statsLabel.snp.bottom).offset(5)
            make.left.equalTo(iconView.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension StatsView {
    struct StatsModel {
        var icon: UIImage
        var description: String
        var statistics: Int
    }
}


