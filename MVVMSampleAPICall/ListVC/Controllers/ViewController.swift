//
//  ViewController.swift
//  MVVMSampleAPICall
//
//  Created by Anilkumar on 12/04/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //outlets
    @IBOutlet weak var listTableview: UITableView!
    let listViewmodel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            //register cell
        self.configureTable()
    }
    
    func configureTable() {
        listTableview.register(UINib(nibName: "ListTableviewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "tableviewCellIdentifier")
        listTableview.delegate = self
        listTableview.dataSource = self
        self.reloadTable()

    }
    
    func reloadTable() {
        listViewmodel.fetchPosts(){
            DispatchQueue.main.async {
                self.listTableview.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewmodel.postss.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewCellIdentifier") as? ListTableviewCellTableViewCell {
        cell.displayDataIntoTable(title: listViewmodel.postss[indexPath.row].title)
        return cell
    }
    
    return UITableViewCell()
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

