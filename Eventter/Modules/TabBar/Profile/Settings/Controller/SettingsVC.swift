//
//  SettingsVC.swift
//  Eventter
//
//  Created by Чингиз Саткан on 11.09.2022.
//
import UIKit

enum SettingsRowType: Equatable {
    case imagePicker
    case textFieldWithTitle(type: TitledTextFieldType)
    case signOutButton
}

enum TitledTextFieldType: String {
    case name = "Name"
    case last_name = "last_name"
    case username = "Username"
    case password = "Password"
}

class SettingsVC: BaseViewController {
    private var data: User?
    
    lazy var rows: [SettingsRowType] = [
        .imagePicker,
        .textFieldWithTitle(type: .name),
        .textFieldWithTitle(type: .last_name),
        .textFieldWithTitle(type: .username),
        .textFieldWithTitle(type: .password),
        .signOutButton
    ]
    
    private(set) lazy var tableView: NoScrollableTableView = {
        let v = NoScrollableTableView()
        
        v.delegate = self
        v.dataSource = self
        v.register(SignoutButton.self, forCellReuseIdentifier: SignoutButton.identifier)
        v.register(ImagePickerCell.self, forCellReuseIdentifier: ImagePickerCell.identifier)
        v.register(TextFieldWithTitleCell.self, forCellReuseIdentifier: TextFieldWithTitleCell.identifier)
        v.separatorStyle = .none
        return v
    }()
    
    init(userData: User?) {
        data = userData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(didTapDoneButton))
    }
    
    @objc private func didTapDoneButton() {
        var image: UIImage?
        var name: String?
        var last_name: String?
        var username: String?
        var password: String?
        for (index, row) in rows.enumerated() {
            switch row {
            case .imagePicker:
                guard let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? ImagePickerCell else { return }
                image = cell.pickerImageView.image
            case let .textFieldWithTitle(type):
                guard let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? TextFieldWithTitleCell else { return }
                if let text = cell.textfield.text, text != "" {
                    switch type {
                    case .name:
                        name = text
                    case .last_name:
                        last_name = text
                    case .username:
                        username = text
                    case .password:
                        break
                    }
                }
            default:
                break
            }
        }
        UserSessionManager.shared.setCurrentUser(user: User(
            photo: image ?? UserSessionManager.shared.currentUser?.photo,
            first_name: name ?? UserSessionManager.shared.currentUser?.first_name,
            last_name: last_name ?? UserSessionManager.shared.currentUser?.last_name,
            leetcode_username: username ?? UserSessionManager.shared.currentUser?.leetcode_username,
            password: password ?? UserSessionManager.shared.currentUser?.password
        ))
        dismiss(animated: true)
    }
    
    @objc private func didTapChangePassword() {
        let changePasswordVC = ChangePasswordVC(userdata: data)
        self.navigationController?.pushViewController(changePasswordVC, animated: true)
    }
    
    private func didTapSignoutButton() {
        print("reached")
    }
    
    private func didTapChangePhoto() {
        let ac = UIAlertController(title: "Choose new photo", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { _ in
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.delegate = self
            vc.allowsEditing = true
            self.present(vc, animated: true)
        }))
        present(ac, animated: true)
    }
    
    override func setView() {
        super.setView()
        
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case .imagePicker:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImagePickerCell.identifier, for: indexPath)
            if let cell = cell as? ImagePickerCell {
                cell.didTapChangePhoto = { [weak self] in
                    self?.didTapChangePhoto()
                }
                cell.configure(image: UserSessionManager.shared.currentUser?.photo)
            }
            return cell
        case let .textFieldWithTitle(type):
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldWithTitleCell.identifier, for: indexPath)
            if let cell = cell as? TextFieldWithTitleCell {
                switch type {
                case .name:
                    cell.configure(with: type.rawValue, placeholder: UserSessionManager.shared.currentUser?.first_name)
                case .last_name:
                    cell.configure(with: type.rawValue, placeholder: UserSessionManager.shared.currentUser?.last_name)
                case .username:
                    cell.configure(with: type.rawValue, placeholder: UserSessionManager.shared.currentUser?.leetcode_username)
                case .password:
                    cell.configure(with: type.rawValue, placeholder: "*********")
                    cell.didTapChangePassword = { [weak self] in
                        self?.didTapChangePassword()
                    }
                    cell.textfield.addTarget(self, action: #selector(didTapChangePassword), for: .touchDown)
                }
            }
            return cell
        case .signOutButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: SignoutButton.identifier, for: indexPath)
            if let cell = cell as? SignoutButton {
                cell.didTapSignoutButton = { [weak self] in
                    self?.didTapSignoutButton()
                }
                cell.configure(with: "Sign Out")
            }
            return cell
        }
    }
}

extension SettingsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            
            guard let row = rows.firstIndex(where: { $0 == .imagePicker }),
                  let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? ImagePickerCell
            else { return }
            cell.pickerImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
