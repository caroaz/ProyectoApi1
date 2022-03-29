//
//  AliveViewController.swift
//  api
//
//  Created by Mobdev on 29-03-22.
//

import UIKit

class AliveViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var speciesLebel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var genderLabel: UILabel!
    
    
    var dataName: String = ""
    var speciesData: String = ""
    var statusData: String = ""
    var genderData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = dataName
        speciesLebel.text = "Specie: \(speciesData)"
        statusLabel.text = "Status: \(statusData)"
        genderLabel.text = "Gender: \(genderData)"
        // Do any additional setup after loading the view.
    }
    

  
}
