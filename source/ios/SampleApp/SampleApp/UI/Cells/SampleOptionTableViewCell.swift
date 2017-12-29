import Foundation
import UIKit

class SampleOptionTableViewCell: UITableViewCell {
    
    var lbDescription: UILabel!
    var ivIcon: UIImageView!
    var lineView: UIView!
    var containerView: UIView!
    var sampleOption: SampleOption!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createAll()
        layoutAll()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bind(sampleOption: SampleOption) {
        self.sampleOption = sampleOption
        
        lbDescription.text = sampleOption.getDescription()
        ivIcon.image = sampleOption.getImage()
        
        lineView.isHidden = !sampleOption.hasSeparator
    }
    
    func createAll() {
        contentView.backgroundColor = UIColor.clear
        
        // container
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        // divider
        lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = UIColor(hexString: "#CCCCCC")
        contentView.addSubview(lineView)
        
        // description
        lbDescription = UILabel()
        lbDescription.textAlignment = NSTextAlignment.left
        lbDescription.textColor = UIColor(hexString: "#333333")
        lbDescription.font = UIFont.systemFont(ofSize: 14)
        lbDescription.numberOfLines = 0
        lbDescription.translatesAutoresizingMaskIntoConstraints = false
        lbDescription.backgroundColor = UIColor.clear
        lbDescription.lineBreakMode = .byWordWrapping
        containerView.addSubview(lbDescription)
        
        // icon
        ivIcon = UIImageView()
        ivIcon.tintColor = UIColor(hexString: "#ff3860")
        ivIcon.translatesAutoresizingMaskIntoConstraints = false
        ivIcon.backgroundColor = UIColor.clear
        containerView.addSubview(ivIcon)
    }
    
    func layoutAll() {
        contentView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: -20.0))
        contentView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 55.0))
        contentView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        
        contentView.addConstraint(NSLayoutConstraint(item: lineView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: -10.0))
        contentView.addConstraint(NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1.0))
        contentView.addConstraint(NSLayoutConstraint(item: lineView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        contentView.addConstraint(NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 4.0))
        
        containerView.addConstraint(NSLayoutConstraint(item: ivIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 26.0))
        containerView.addConstraint(NSLayoutConstraint(item: ivIcon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 26.0))
        containerView.addConstraint(NSLayoutConstraint(item: ivIcon, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        containerView.addConstraint(NSLayoutConstraint(item: ivIcon, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1.0, constant: 0.0))
        
        containerView.addConstraint(NSLayoutConstraint(item: lbDescription, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        containerView.addConstraint(NSLayoutConstraint(item: lbDescription, attribute: .leading, relatedBy: .equal, toItem: ivIcon, attribute: .trailing, multiplier: 1.0, constant: 10.0))
        containerView.addConstraint(NSLayoutConstraint(item: lbDescription, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1.0, constant: 0.0))        
    }
    
}
