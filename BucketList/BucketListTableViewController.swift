//
//  BucketListTableViewController.swift
//  BucketList
//
//  Created by Parth Patidar on 9/17/17.
//  Copyright © 2017 Parth Patidar. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController {
    
    
    @IBOutlet var tableview: UITableView!
    
    var list : [BucketItem] = []

    
    
    func AddItem(name:String, date:Date, longitude:Double, latitude:Double,description:String ) {
        let bucket = (BucketItem(name: name, date: date, done: false, longitude:longitude, latitude:latitude, des: description))
        list += [bucket]
        orderTable()
        
    }
    
    func orderTable() {
        list.sort(by: {$0.date < $1.date})
        list.sort { !$0.Done && $1.Done }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        list += [BucketItem(name: "Streak the Lawn", date: Date(), done: false, longitude: 10.0, latitude: 11.0, des: "streak the lawn alot")]
        orderTable()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let bucket_item: BucketItem = list[indexPath.row]
        cell.textLabel?.text = bucket_item.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateString = dateFormatter.string(from: bucket_item.date)
        cell.detailTextLabel?.text = dateString
        if (bucket_item.Done) {
            cell.backgroundColor = .lightGray
        }
        else {
            cell.backgroundColor = .white
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        
        
        let done = UITableViewRowAction(style: .default, title: "Done") { action, index in
            
            let temp = self.list[index.row]
            let currentStatus = temp.Done
            temp.Done = !currentStatus
            self.orderTable()
            
        
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
 
            self.performSegue(withIdentifier: "Edit", sender: index)
            
            
        }
        edit.backgroundColor = .lightGray
        
        done.backgroundColor = .blue
        
        return [done, edit]
    }
    
    //Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        if segue.source is AddItemViewController {
            if let senderVC = segue.source as? AddItemViewController {
                AddItem(name: senderVC.nameToDisplay, date: senderVC.dateToDisplay, longitude: senderVC.longToDisplay, latitude: senderVC.latToDisplay, description: senderVC.desToDisplay )
                orderTable()
            }
        }
    }
    
    @IBAction func unwindToVC2(segue:UIStoryboardSegue) {
        if segue.source is EditItemViewController {
            if let senderVC = segue.source as? EditItemViewController {
                let BucketItem = list[senderVC.passIndex]
                BucketItem.name = senderVC.nameToDisplay
                BucketItem.date = senderVC.dateToDisplay
                BucketItem.Longitude = senderVC.longToDisplay
                BucketItem.Latitude = senderVC.latToDisplay
                BucketItem.des = senderVC.desToDisplay
                 orderTable()
            }
            tableview.reloadData()
        }
    }
    
    // Override to support rearranging the table view.
    //override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    
    //}
    
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Edit" {
            if let navController = segue.destination as? UINavigationController {
                
                if let chidVC = navController.topViewController as? EditItemViewController {
                        let selectedRow = (sender as! NSIndexPath).row;
                        print(selectedRow)
                        chidVC.index = selectedRow
                        chidVC.recievedItem = list[selectedRow]

                    }
                }
                
            }
            
        
            
            
        }
    }

