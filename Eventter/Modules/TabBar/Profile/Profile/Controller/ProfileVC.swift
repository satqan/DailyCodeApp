//
//  ProfileVC.swift
//  Eventter
//
//  Created by Чингиз Саткан on 31.08.2022.
//

import UIKit

class ProfileVC: BaseViewController {
    
    let headerView: UserInfoView = {
        let headerView = UserInfoView()
        headerView.configure(with: UserInfoView.UserModel(
            name: UserSessionManager.shared.currentUser?.first_name,
            last_name: UserSessionManager.shared.currentUser?.last_name,
            username: UserSessionManager.shared.currentUser?.leetcode_username,
            image: UserSessionManager.shared.currentUser?.photo
        ))
        headerView.addShadow()
        headerView.backgroundColor = .white
        return headerView
    }()
    
    let streakView: StatsView = {
        let streak = StatsView()
        streak.configure(with: StatsView.StatsModel(icon: UIImage(named: "fire")!, description: "Streak", statistics: 135))
        streak.addShadow()
        streak.backgroundColor = .white
        return streak
    }()
    
    let ratingView: StatsView = {
        let rating = StatsView()
        rating.configure(with: StatsView.StatsModel(icon: UIImage(named: "lightning")!, description: "Points", statistics: 1300))
        rating.addShadow()
        rating.backgroundColor = .white
        return rating
    }()

    let statisticsView = SolvedProblemsContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let name = UserSessionManager.shared.currentUser?.first_name,
              let last_name = UserSessionManager.shared.currentUser?.last_name,
              let username = UserSessionManager.shared.currentUser?.leetcode_username
        else { return }
        headerView.imageView.image = UserSessionManager.shared.currentUser?.photo
        headerView.nameLabel.text = "\(name) \(last_name)"
        headerView.leetcodeUserLabel.text = username
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "Profile"
        let settingImage = UIImage(systemName: "gear")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: settingImage,
            style: .plain,
            target: self,
            action: #selector(didTapSettingsButton)
        )
    }
    
    override func setView() {
        super.setView()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 16

        stackView.addArrangedSubviews(streakView, ratingView)
        contentView.addSubviews(headerView, stackView, statisticsView)
        headerView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        statisticsView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.bottom.equalToSuperview().offset(-16)
        }
    }
    
    @objc private func didTapSettingsButton() {
        let settingsVC = SettingsVC(userData: UserSessionManager.shared.currentUser)
        let navVC = UINavigationController(rootViewController: settingsVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

