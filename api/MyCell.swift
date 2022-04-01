//
//  MyCell.swift
//  api
//
//  Created by Mobdev on 31-03-22.
//

import UIKit

class MyCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var speciesLabel = UILabel()
    var characterImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(speciesLabel)
        contentView.addSubview(characterImageView)
        
        configureNameLabel()
        configureImageView()
        setImageConstraint()
        setNameLabelConstraint()
        setSpeciesLabelConstraint()
        speciesNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(results: Character){
        let url = URL(string: results.image)
        characterImageView.downloaded(from: url!)
        nameLabel.text = results.name
        speciesLabel.text = results.species
    }
    func configureImageView () {
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
    }
    
    func configureNameLabel(){
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    func speciesNameLabel(){
        speciesLabel.numberOfLines = 0
        speciesLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraint(){
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalTo:  characterImageView.heightAnchor,multiplier: 16/9)
            
        ])
    }
    
    func setNameLabelConstraint(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 20),
//            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor, constant: -12)
            
        ])
    }
    func setSpeciesLabelConstraint(){
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            speciesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            speciesLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 20),
//            speciesLabel.heightAnchor.constraint(equalToConstant: 30),
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            speciesLabel.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor, constant: -12)
        ])
    }
}
