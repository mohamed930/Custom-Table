//
//  HomeTableViewController.swift
//  TestCustom
//
//  Created by Mohamed Ali on 7/16/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class GuestData {
    var id:Int
    var Name:String
    var Age:Int
    var Salary:Int
    
    init(id:Int,Name:String,Age:Int,Salary:Int) {
        self.id = id
        self.Name = Name
        self.Age = Age
        self.Salary = Salary
    }
}

class HomeTableViewController: UITableViewController {
    
    var Arr = Array<GuestData>()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        Arr.append(GuestData(id: 1, Name: "Mohamed ggghfhddhdhdhdd", Age: 21, Salary: 4000))
        Arr.append(GuestData(id: 2, Name: "Ahmed ggghfhddhdhdhdd", Age: 23, Salary: 5000))
        Arr.append(GuestData(id: 3, Name: "Fahed Faris ggghfhddhdhdhdd", Age: 24, Salary: 10000))
        Arr.append(GuestData(id: 4, Name: "Cavil ggghfhddhdhdhdd", Age: 41, Salary: 45300))
        Arr.append(GuestData(id: 1, Name: "Mohamed ggghfhddhdhdhdd", Age: 21, Salary: 4000))
        Arr.append(GuestData(id: 2, Name: "Ahmed ggghfhddhdhdhdd", Age: 23, Salary: 5000))
        Arr.append(GuestData(id: 3, Name: "Fahed Faris ggghfhddhdhdhdd", Age: 24, Salary: 10000))
        Arr.append(GuestData(id: 4, Name: "Cavil ggghfhddhdhdhdd", Age: 41, Salary: 45300))
        Arr.append(GuestData(id: 1, Name: "Mohamed ggghfhddhdhdhdd", Age: 21, Salary: 4000))
        Arr.append(GuestData(id: 2, Name: "Ahmed ggghfhddhdhdhdd", Age: 23, Salary: 5000))
        Arr.append(GuestData(id: 3, Name: "Fahed Faris ggghfhddhdhdhdd", Age: 24, Salary: 10000))
        Arr.append(GuestData(id: 4, Name: "Cavil ggghfhddhdhdhdd", Age: 41, Salary: 45300))
        Arr.append(GuestData(id: 1, Name: "Mohamed ggghfhddhdhdhdd", Age: 21, Salary: 4000))
        Arr.append(GuestData(id: 2, Name: "Ahmed ggghfhddhdhdhdd", Age: 23, Salary: 5000))
        Arr.append(GuestData(id: 3, Name: "Fahed Faris ggghfhddhdhdhdd", Age: 24, Salary: 10000))
        Arr.append(GuestData(id: 4, Name: "Cavil ggghfhddhdhdhdd", Age: 41, Salary: 45300))
        Arr.append(GuestData(id: 1, Name: "Mohamed ggghfhddhdhdhdd", Age: 21, Salary: 4000))
        Arr.append(GuestData(id: 2, Name: "Ahmed ggghfhddhdhdhdd", Age: 23, Salary: 5000))
        Arr.append(GuestData(id: 3, Name: "Fahed Faris ggghfhddhdhdhdd", Age: 24, Salary: 10000))
        Arr.append(GuestData(id: 4, Name: "Cavil ggghfhddhdhdhdd", Age: 41, Salary: 45300))
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header : HeaderViewCell = Bundle.main.loadNibNamed("HeaderViewCell", owner: self, options: nil)? .first as! HeaderViewCell
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 53.0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.idLabel.text = String(Arr[indexPath.row].id)
        cell.NameLabel.text = Arr[indexPath.row].Name
        cell.AgeLabel.text = String(Arr[indexPath.row].Age)
        cell.SalaryLabel.text = String(Arr[indexPath.row].Salary)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 53.0
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = EditAction(at: indexPath)
        let delete = DeleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete,edit])
    }
    
    func EditAction(at IndexPath: IndexPath) -> UIContextualAction {
        let row = Arr[IndexPath.row]
        let action = UIContextualAction(style: .normal, title: "Edit") { (action, view, completion) in
            
            // move to NewViewController
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let EditViewController = storyboard.instantiateViewController(identifier: "EditData") as! EditDataViewController
            EditViewController.modalPresentationStyle = .fullScreen
            EditDataViewController.singleData = row
            self.present(EditViewController, animated: true, completion: nil)
            
            completion(true)
        }
        
        action.backgroundColor = .purple
        return action
        
    }
    
    func DeleteAction(at IndexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            // Delete Cell.
            
            let alert = UIAlertController(title: "Alert", message: "Are You Sure To Delete This Elemente?", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(action1)
            
            let action2 = UIAlertAction(title: "Delete", style: .destructive) { (alert) in
                self.Arr.remove(at: IndexPath.row)
                self.tableView.reloadData()
            }
            alert.addAction(action2)
            
            self.present(alert, animated: true, completion: nil)
            
            
            
            completion(true)
        }
        
        action.backgroundColor = .red
        return action
    }
}
