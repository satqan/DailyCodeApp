//
//  RatingTableCell.swift
//  Eventter
//
//  Created by Чингиз Саткан on 04.09.2022.
//

import UIKit

class RatingTableCell: BaseTableViewCell {
    
    let containerView: RatingTableCellContainerView = {
        let view = RatingTableCellContainerView()
        view.backgroundColor = .white
        view.addShadow()
        return view
    }()
    
    func configure(with viewModel: RatingTableCellContainerView.ViewModel) {
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

