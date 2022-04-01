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
    var imageData: String = ""
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            NameLabel.text = dataName
            speciesLabel.text = "Specie: \(speciesData)"
            statusLabel.text = "Status: \(statusData)"
            genderLabel.text = "Gender: \(genderData)"
            
            
            
            let url = URL(string: imageData)!
            
    //        iimageView.setRounded()
//            imageView.downloaded(from: url)
//            
//            imageView.layer.cornerRadius = 10.0
    //        imageView.clipsToBounds = true
    //        imageView.layer.masksToBounds = true
            
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
        
    //    func setRounded( ) {
    //
    //        self.frame.size.width = 10
    //        self.frame.size.height = 10
    //
    //        self.layer.cornerRadius = 100
    //        self.clipsToBounds = true
            
            //        self.layer.cornerRadius = frame.width / 2
            //        self.layer.masksToBounds = true
        }
