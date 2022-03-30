//
//  UnknownViewController.swift
//  api
//
//  Created by Mobdev on 29-03-22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
   var  dataName : String = ""
    var statusData : String = ""
    var speciesData : String = ""
    var genderData : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        NameLabel.text = dataName
        speciesLabel.text = "Specie: \(speciesData)"
        statusLabel.text = "Status: \(statusData)"
        genderLabel.text = "Gender: \(genderData)"
        
        // Do any additional setup after loading the view.
    }
    

}
