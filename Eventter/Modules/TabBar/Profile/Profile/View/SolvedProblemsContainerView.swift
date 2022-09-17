//
//  SolvedProblemsContainerView.swift
//  Eventter
//
//  Created by Чингиз Саткан on 10.09.2022.
//

import UIKit

class SolvedProblemsContainerView: BaseView {
    
    let easyView: SolvedProblemsView = {
        let easy = SolvedProblemsView()
        easy.configure(with: SolvedProblemsView.ProblemModel(complexity: "easy", progress: 1/2, color: .green))
        return easy
    }()
    
    let mediumView: SolvedProblemsView = {
        let medium = SolvedProblemsView()
        medium.configure(with: SolvedProblemsView.ProblemModel(complexity: "medium", progress: 1/3, color: .yellow))
        return medium
    }()
    
    let hardView: SolvedProblemsView = {
        let hard = SolvedProblemsView()
        hard.configure(with: SolvedProblemsView.ProblemModel(complexity: "hard", progress: 1/5, color: .red))
        return hard
    }()
    
    override func setView() {
        super.setView()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .white
        stackView.addShadow()
        
        stackView.addArrangedSubviews(easyView, mediumView, hardView)
        addSubviews(stackView)
        
        stackView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
    }
}
