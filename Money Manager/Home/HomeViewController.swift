//
//  HomeViewController.swift
//  Money Manager
//
//  Created by TaLi on 12/28/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        
    }
    func configTableView() {
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 100
        
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
