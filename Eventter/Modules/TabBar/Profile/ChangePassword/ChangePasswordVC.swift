//
//  ChangePasswordVC.swift
//  Eventter
//
//  Created by Чингиз Саткан on 13.09.2022.
//

import UIKit

enum PasswordRowType: Equatable {
    case textFieldWithTitle(type: PasswordTextFieldType)
    case submitButton
}

enum PasswordTextFieldType: String {
    case oldPassword = "Old password"
    case newPassword = "New password"
    case confirmPassword = "Confirm new password"
}

class ChangePasswordVC: BaseViewController {
    private var data: User?
    
    lazy var rows: [PasswordRowType] = [
        .textFieldWithTitle(type: .oldPassword),
        .textFieldWithTitle(type: .newPassword),
        .textFieldWithTitle(type: .confirmPassword),
        .submitButton
    ]
    
    private(set) lazy var tableView: NoScrollableTableView = {
        let tableView = NoScrollableTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SubmitButton.self, forCellReuseIdentifier: SubmitButton.identifier)
        tableView.register(SignoutButton.self, forCellReuseIdentifier: SignoutButton.identifier)
        tableView.register(TextFieldWithTitleCell.self, forCellReuseIdentifier: TextFieldWithTitleCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init(userdata: User?) {
        data = userdata
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Change password"
    }

    override func setView() {
        super.setView()
        
        contentView.addSubviews(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func didTapSubmitButton() {
        dismiss(animated: true)
    }
}

extension ChangePasswordVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case let .textFieldWithTitle(type):
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldWithTitleCell.identifier, for: indexPath)
            if let cell = cell as? TextFieldWithTitleCell {
                switch type {
                case .oldPassword:
                    cell.configure(with: type.rawValue, placeholder: "")
                case .newPassword:
                    cell.configure(with: type.rawValue, placeholder: "")
                case .confirmPassword:
                    cell.configure(with: type.rawValue, placeholder: "")
                }
            }
            return cell
        case .submitButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: SubmitButton.identifier, for: indexPath)
            if let cell = cell as? SubmitButton {
                cell.didTapSubmitButton = { [weak self] in
                    self?.didTapSubmitButton()
                }
                cell.configure(with: "Submit")
            }
            return cell
        }
    }
}


