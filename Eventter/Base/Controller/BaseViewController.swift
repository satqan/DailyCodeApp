//
//  BaseViewController.swift
//  Eventter
//
//  Created by Чингиз Саткан on 31.08.2022.
//

import UIKit

class BaseViewController: ScrollViewController, ViewConfigurable  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView(){ }
}
