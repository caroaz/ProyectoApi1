//
//  DeadViewController.swift
//  api
//
//  Created by Mobdev on 29-03-22.
//

import UIKit

class DeadViewController: UIViewController {
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var SpeciesLabel: UILabel!
    
    @IBOutlet weak var StatusLabel: UILabel!
    
    
    @IBOutlet weak var GenderLabel: UILabel!
    
    
    var dataName: String = ""
    var speciesData: String = ""
    var statusData: String = ""
    var genderData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameLabel.text = dataName
        SpeciesLabel.text = "Specie: \(speciesData)"
        StatusLabel.text = "Status: \(statusData)"
        GenderLabel.text = "Gender: \(genderData)"
        // Do any additional setup after loading the view.
    }
    
}
