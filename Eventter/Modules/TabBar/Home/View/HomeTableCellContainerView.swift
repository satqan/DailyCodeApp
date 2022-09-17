import Foundation
import UIKit

class HomeTableCellContainerView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let checkBox = CheckBox(type: .system)
    
    func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
    }
    
    func reset() {
        titleLabel.text = nil
    }
    
    override func setView() {
        addSubviews(checkBox, titleLabel)
        
        checkBox.snp.makeConstraints { make in
            make.height.width.equalTo(25)
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(checkBox.snp.right).offset(16)
            make.right.equalToSuperview().offset(-110)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension HomeTableCellContainerView {
    struct ViewModel {
        var title: String
    }
}
