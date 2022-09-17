//
//  BaseTableViewCell.swift
//  Eventter
//
//  Created by Чингиз Саткан on 31.08.2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell, ViewConfigurable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func setView(){ }
}
