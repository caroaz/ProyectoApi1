
import UIKit

class MyDataViewCell: UITableViewCell {
    
    var contentLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(contentLabel)
        
        
        configureContentLabel()
        setLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContentLabel () {
        contentLabel.numberOfLines = 0
        contentLabel.adjustsFontSizeToFitWidth = true
        contentLabel.textAlignment = .center
        contentLabel.font = UIFont.italicSystemFont(ofSize: 20.0)
    }
    
    func setLabelConstraint(){
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            contentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
        ])
    }
    
}


