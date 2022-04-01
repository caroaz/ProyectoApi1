//
//  UnknownViewController.swift
//  api
//
//  Created by Mobdev on 29-03-22.
//

import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var SpeciesLabel: UILabel!
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var ImageDetailView: UIImageView!
    
    
    var  dataName : String = ""
    var statusData : String = ""
    var speciesData : String = ""
    var genderData : String = ""
    var imageData: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameLabel.text = dataName
        SpeciesLabel.text = "Specie: \(speciesData)"
        StatusLabel.text = "Status: \(statusData)"
        GenderLabel.text = "Gender: \(genderData)"
        
        
        
        let url = URL(string: imageData)!
        
        //        iimageView.setRounded()
        ImageDetailView.downloaded(from: url)
        //
        ImageDetailView.layer.cornerRadius = 10.0
        ImageDetailView.clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
    }
    private func loadData(){
        
    }
    
}




extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                //                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                //                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data,
                let image = UIImage(data: data)
            else {
                return }
            
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
}
