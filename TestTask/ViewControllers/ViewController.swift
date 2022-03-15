//
//  ViewController.swift
//  TestTask
//
//  Created by Vardan Sargsyan on 14.03.22.
//

import UIKit

class ViewController: UIViewController {

    
    
    var viewModel = ViewModel()
    

    @IBOutlet weak var categoriesTableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
        self.viewModel.getItems { hasResult in
            if hasResult! {
                    DispatchQueue.main.async {
                        self.categoriesTableView.reloadData()
                    }
            }
        }
        
        
        
    }


}


extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        cell.items = self.viewModel.sections[indexPath.section].items
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sections.count
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.viewModel.sections[section].header
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(named: "TextColor")
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    
    
    
}
