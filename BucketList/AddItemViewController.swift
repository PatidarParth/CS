//
//  AddItemViewController.swift
//  BucketList
//
//  Created by Parth Patidar on 9/17/17.
//  Copyright © 2017 Parth Patidar. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    var nameToDisplay: String!
    var dateToDisplay:Date!
    var latToDisplay: Double!
    var longToDisplay:Double!
    var desToDisplay: String!

    
 
    @IBOutlet weak var descriptin: UITextField!
    @IBOutlet weak var Date: UIDatePicker!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var latitude: UITextField!

    
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindAdd", sender: self)
    }
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            nameToDisplay = Name.text!
            dateToDisplay = Date.date
            latToDisplay = Double(latitude.text!) ?? 0.0
            longToDisplay = Double(longitude.text!) ?? 0.0
            desToDisplay = descriptin.text!

        }
    }

    


