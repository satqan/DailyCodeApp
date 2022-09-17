//
//  NewProblemVC.swift
//  Eventter
//
//  Created by Чингиз Саткан on 04.09.2022.
//

import UIKit

protocol NewProblemVCDelegate: AnyObject {
    func newProblemDidCreate(vm: HomeTableCellContainerView.ViewModel)
}

class NewProblemVC: BaseViewController {
    
    weak var delegate: NewProblemVCDelegate?
    
    let textField: UITextField = {
        let t = UITextField()
        t.addShadow()
        t.borderStyle = .roundedRect
        t.placeholder = "Code of the problem"
        return t
    }()
    
    lazy var submitButton: UIButton = {
        let b = UIButton()
        b.setTitle("Add Problem", for: .normal)
        b.backgroundColor = .systemBlue
        b.addShadow()
        b.addTarget(self, action: #selector(willCreateProblem), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setView() {
        super.setView()
        
        contentView.addSubviews(textField, submitButton)
        
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(90)
            make.right.equalToSuperview().offset(-90)
            make.top.equalToSuperview().offset(16)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.height.equalTo(42)
            make.width.equalTo(144)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func willCreateProblem() {
        guard let inputText = textField.text else { return }
        let newProblem = HomeTableCellContainerView.ViewModel(title: inputText)
        delegate?.newProblemDidCreate(vm: newProblem)
        dismiss(animated: true)
    }
    
}
