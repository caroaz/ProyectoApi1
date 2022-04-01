//
//  MyCell.swift
//  api
//
//  Created by Mobdev on 31-03-22.
//

import UIKit

class MyCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var characterImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(characterImageView)
        
        configureNameLabel()
        configureImageView()
        setImageConstraint()
        setNameLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(results: Character){
        let url = URL(string: results.image)
        characterImageView.downloaded(from: url!)
        nameLabel.text = results.name
    }
    func configureImageView () {
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
    }
    
    func configureNameLabel(){
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraint(){
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalTo:  characterImageView.heightAnchor,multiplier: 16/9)
        
        ])
    }
    
    func setNameLabelConstraint(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 80),
            nameLabel.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -12)
        
        ])
    }
}
