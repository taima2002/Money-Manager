//
//  CategoyViewController.swift
//  Money Manager
//
//  Created by TaLi on 12/31/21.
//

import UIKit

class CategoyViewController: UIViewController {
    var listCategory: [CategoryFilter] = []
    var pageIndex = 0
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
extension CategoyViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listCategory.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCategory[section].subCategories.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
extension CategoyViewController {
    static func createVC(listCategory: [CategoryFilter], pageIndex: Int) -> CategoyViewController {
        let vc = UIStoryboard(name: "Category", bundle: nil).instantiateViewController(withIdentifier: "CategoryVC") as! CategoyViewController
        vc.listCategory = listCategory
        vc.pageIndex = pageIndex
        return vc
        
    }
}
