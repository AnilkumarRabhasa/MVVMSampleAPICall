//
//  ViewController.swift
//  MVVMSampleAPICall
//
//  Created by Anilkumar on 12/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var listTableview: UITableView!
    let listViewmodel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTable()
        self.reloadTable()
    }
    
    func configureTable() {
        listTableview.register(UINib(nibName: "ListTableviewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "tableviewCellIdentifier")
        listTableview.delegate = self
        listTableview.dataSource = self
        
    }
    
    func reloadTable() {
        listViewmodel.fetchPosts(){
            DispatchQueue.main.async {
                self.listTableview.reloadData()
            }
        }
    }
}

// Pragma UITableview Data source and Delegate methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewmodel.postss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewCellIdentifier") as? ListTableviewCellTableViewCell {
            cell.displayDataIntoTable(list: listViewmodel.postss[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
}

