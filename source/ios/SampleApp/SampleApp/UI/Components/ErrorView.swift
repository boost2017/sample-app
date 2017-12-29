import Foundation
import UIKit

class ErrorView: UIView {
    
    var lbMessage: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(hexString: "#ffffff")
        
        createAll()
        layoutAll()
    }
    
    func createAll() {
        // mensagem
        lbMessage = UILabel()
        lbMessage.textAlignment = NSTextAlignment.center
        lbMessage.textColor = UIColor(hexString: "#cccccc")
        lbMessage.font = UIFont.boldSystemFont(ofSize: 16)
        lbMessage.numberOfLines = 0
        lbMessage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lbMessage)
    }
    
    func layoutAll() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[lbMessage]-|", options: [], metrics: nil, views: [
            "lbMessage": lbMessage
            ]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[lbMessage]-|", options: [], metrics: nil, views: [
            "lbMessage": lbMessage
            ]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
