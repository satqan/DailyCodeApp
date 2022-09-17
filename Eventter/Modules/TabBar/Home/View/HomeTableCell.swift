//
//  HomeTableCell.swift
//  Eventter
//
//  Created by Чингиз Саткан on 31.08.2022.
//

import UIKit

class HomeTableCell: BaseTableViewCell {
    
    let containerView: HomeTableCellContainerView = {
        let view = HomeTableCellContainerView()
        view.backgroundColor = .white
        view.addShadow()
        return view
    }()
    
    func configure(with viewModel: HomeTableCellContainerView.ViewModel) {
        containerView.configure(with: viewModel)
    }
    
    override func setView() {
        super.setView()
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { m in
            m.top.equalToSuperview().offset(8)
            m.left.equalToSuperview().offset(16)
            m.right.equalToSuperview().offset(-16)
            m.bottom.equalToSuperview().offset(-8)
        }
    }
    
    override func prepareForReuse() {
        containerView.reset()
    }
}
