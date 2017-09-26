//
//  EditItemViewController.swift
//  BucketList
//
//  Created by Meera Thenappan on 9/18/17.
//  Copyright © 2017 Parth Patidar. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {

    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var descriptin: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var Date1: UIDatePicker!
    
    var nameToDisplay: String!
    var dateToDisplay:Date!
    var latToDisplay: Double!
    var longToDisplay:Double!
    var desToDisplay: String!
    var index: Int!
    var passIndex: Int!
    var recievedItem = BucketItem(name: "", date: Date(), done: false, longitude: 0.0, latitude: 0.0, des: "")
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(recievedItem.name)
        Name.text = recievedItem.name
        Date1.setDate(recievedItem.date, animated: false)
        descriptin.text = recievedItem.des
        longitude.text = String(recievedItem.Longitude)
        latitude.text = String(recievedItem.Latitude)
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        passIndex = index
        nameToDisplay = Name.text!
        dateToDisplay = Date1.date
        latToDisplay = Double(latitude.text!) ?? 0.0
        longToDisplay = Double(longitude.text!) ?? 0.0
        desToDisplay = descriptin.text!
        
    }

}
