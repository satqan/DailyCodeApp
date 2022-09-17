//
//  SolvedProblemsVC.swift
//  Eventter
//
//  Created by Чингиз Саткан on 12.09.2022.
//

import UIKit

class SolvedProblemsVC: BaseViewController {
    var solvedProblems: [HomeTableCellContainerView.ViewModel] = [
        .init(title: "Problem 1"),
        .init(title: "Problem 2"),
        .init(title: "Problem 3"),
        .init(title: "Problem 4"),
        .init(title: "Problem 5"),
        .init(title: "Problem 6"),
        .init(title: "Problem 7"),
        .init(title: "Problem 8"),
        .init(title: "Problem 9"),
        .init(title: "Problem 10"),
        .init(title: "Problem 11"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private(set) lazy var tableView: NoScrollableTableView = {
        let v = NoScrollableTableView()
        v.delegate = self
        v.dataSource = self
        v.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.identifier)
        v.separatorStyle = .none
        return v
    }()
    
    private func configureNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(didTapDoneButton))
    }
    
    override func setView() {
        super.setView()
        
        contentView.addSubviews(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.height.equalToSuperview()
        }
    }
    
    @objc private func didTapDoneButton() {
        dismiss(animated: true)
    }
}


extension SolvedProblemsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        solvedProblems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.identifier, for: indexPath)
        if let cell = cell as? HomeTableCell {
            cell.configure(with: solvedProblems[indexPath.row])
        }
        return cell
    }
}
