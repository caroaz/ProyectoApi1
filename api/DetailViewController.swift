//
//  UnknownViewController.swift
//  api
//
//  Created by Mobdev on 29-03-22.
//

import UIKit


class DetailViewController: UIViewController {
    
    var imageLabel = UIImageView()
    var nameLabel = UILabel()
    var speciesLabel = UILabel()
    var statusLabel = UILabel()
    var genderLabel = UILabel()
    
    var  dataName : String = ""
    var statusData : String = ""
    var speciesData : String = ""
    var genderData : String = ""
    var imageData: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(imageLabel)
        self.view.addSubview(nameLabel)
        self.view.addSubview(speciesLabel)
        self.view.addSubview(statusLabel)
        self.view.addSubview(genderLabel)
  
        let url = URL(string: imageData)!
        imageLabel.downloaded(from: url)
        
        print(imageData)
        confNameLabel()
        confSpeciesLabel()
        confStatusLabel()
        confGenderLabel()
        
        setNameLabelConstraint1()
        setImageConstraint1()
        setsSpeciesLabelConstraint1()
        setsStatusLabelConstraint1()
        setsGenderLabelConstraint1()
        
        
        // Do any additional setup after loading the view.
    }
    private func loadData(){
        
    }
    func confNameLabel() {
        nameLabel.text = dataName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        nameLabel.textAlignment = .center
    }
    func confSpeciesLabel(){
        speciesLabel.text = "Specie: \(speciesData)"
        speciesLabel.textAlignment = .center
    }
    func confStatusLabel(){
        statusLabel.text = "Status: \(statusData)"
        statusLabel.textAlignment = .center
    }
    func confGenderLabel(){
        genderLabel.text = "Gender: \(genderData)"
        genderLabel.textAlignment = .center
    }
    
    func setNameLabelConstraint1(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 50),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor),

        ])
    }
    
    func setsSpeciesLabelConstraint1(){
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            speciesLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            speciesLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            
        ])
    }
    func setsStatusLabelConstraint1(){
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 20),
            statusLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            statusLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            
        ])
    }
    func setsGenderLabelConstraint1(){
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            genderLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            genderLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            
        ])
    }
    func setImageConstraint1(){
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageLabel.widthAnchor.constraint(equalToConstant: 200),
            imageLabel.heightAnchor.constraint(equalToConstant:  200)
            
        ])
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
