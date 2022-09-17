//
//  HomeVC.swift
//  Eventter
//
//  Created by Чингиз Саткан on 31.08.2022.
//

import UIKit


class HomeVC: BaseViewController {
    var problems: [HomeTableCellContainerView.ViewModel] = [
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
    
    // MARK: -UI Elements
    
    let addButton: UIButton = {
        let button = UIButton()
        let addImage = UIImage(systemName: "plus.circle")
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(addImage, for: .normal)
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var tableView: NoScrollableTableView = {
        let v = NoScrollableTableView()
        v.delegate = self
        v.dataSource = self
        v.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.identifier)
        v.separatorStyle = .none
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "To Do"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(didTapEditButton))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Solved Problems",
            style: .plain,
            target: self,
            action: #selector(didTapSolvedButton))
    }
    
    override func setView() {
        super.setView()
        view.addSubview(addButton)
        contentView.addSubviews(tableView)
        
        tableView.snp.makeConstraints { m in
            m.top.left.right.bottom.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.bottom.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.height.width.equalTo(60)
        }
    }
    
    @objc private func didTapAddButton() {
        let rootVC = NewProblemVC()
        rootVC.title = "Add New Problem"
        let navVC = UINavigationController(rootViewController: rootVC)
        rootVC.delegate = self
        present(navVC, animated: true)
    }
    
    @objc private func didTapSolvedButton() {
        let rootVC = SolvedProblemsVC()
        rootVC.title = "Solved Problems"
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc private func didTapEditButton(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title = (self.tableView.isEditing) ? "Done" : "Edit"
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.identifier, for: indexPath)
        if let cell = cell as? HomeTableCell {
            cell.configure(with: problems[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObjectTemp = problems[sourceIndexPath.item]
        problems.remove(at: sourceIndexPath.item)
        problems.insert(movedObjectTemp, at: destinationIndexPath.item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            problems.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension HomeVC: NewProblemVCDelegate {
    
    func newProblemDidCreate(vm: HomeTableCellContainerView.ViewModel) {
        problems.append(vm)
        tableView.reloadData()
    }
}
