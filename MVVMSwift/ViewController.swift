//
//  ViewController.swift
//  MVVMSwift
//
//  Created by user on 22/03/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModelObj: ViewModel?
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModelObj = ViewModel()
        fetchData()
    }
    func fetchData()
    {
        viewModelObj?.getList {
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelObj?.numberOfItemsToDisplay(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModelObj?.cellTitleForCell(for: indexPath)
        return cell
    }
}

