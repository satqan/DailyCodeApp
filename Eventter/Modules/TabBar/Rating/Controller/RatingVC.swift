//
//  RatingVC.swift
//  Eventter
//
//  Created by Чингиз Саткан on 04.09.2022.
//

import UIKit

class RatingVC: BaseViewController {
    var rows: [RatingTableCellContainerView.ViewModel] = [
        .init(standing: 1, nickname: "Dastan Bekmukhanbetov", points : 1000),
        .init(standing: 2, nickname: "Shyngys Satkan", points : 800),
        .init(standing: 3, nickname: "Meiirlan Suiirkhanov", points : 700),
        .init(standing: 4, nickname: "Abylay Kairatbek", points : 600),
        .init(standing: 5, nickname: "Denis Ten", points : 100),
        .init(standing: 6, nickname: "Nurmukhamet Aitimbayev", points : 60),
        .init(standing: 7, nickname: "Nurtau Toganbay", points : 20),
        .init(standing: 8, nickname: "Vladimir Usoltsev", points : 8),
        .init(standing: 9, nickname: "Amirzhan Armandiyev", points : 0),
        .init(standing: 10, nickname: "Shyngys Satkan", points : 0),
        .init(standing: 11, nickname: "Dastan Bekmukhanbetov", points : 0),
    ]

    private(set) lazy var tableView: NoScrollableTableView = {
        let v = NoScrollableTableView()
        v.delegate = self
        v.dataSource = self
        v.register(RatingTableCell.self, forCellReuseIdentifier: RatingTableCell.identifier)
        v.separatorStyle = .none
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "Rating"
    }
    
    override func setView() {
        super.setView()
        contentView.addSubviews(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
}

extension RatingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RatingTableCell.identifier, for: indexPath)
        if let cell = cell as? RatingTableCell {
            cell.configure(with: rows[indexPath.row])
        }
        return cell
    }
}
