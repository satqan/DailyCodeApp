//
//  SolvedProblemsView.swift
//  Eventter
//
//  Created by Чингиз Саткан on 10.09.2022.
//

import UIKit

class SolvedProblemsView: BaseView {
    
    private (set) lazy var progressBarView: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.layer.cornerRadius = 14
        progressBar.clipsToBounds = true
        progressBar.trackTintColor = .lightGray
        return progressBar
    }()
    
    let levelLabel: UILabel = {
        let level = UILabel()
        return level
    }()
    
    func configure(with problemModel: ProblemModel) {
        levelLabel.text = problemModel.complexity
        progressBarView.progress = problemModel.progress
        progressBarView.tintColor = problemModel.color
    }
    
    override func setView() {
        super.setView()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        
        stackView.addArrangedSubviews(levelLabel, progressBarView)
        addSubviews(stackView)
        
        stackView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.bottom.equalToSuperview().offset(-16)
        }
        
        progressBarView.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
    }
}

extension SolvedProblemsView {
    struct ProblemModel {
        var complexity: String
        var progress: Float
        var color: UIColor
    }
}
