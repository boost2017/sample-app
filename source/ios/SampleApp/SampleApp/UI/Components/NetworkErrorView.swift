import Foundation
import UIKit

protocol NetworkErrorViewProtocol {
    func networkErrorViewProtocolOnAction(action: NetworkErrorViewAction)
}

class NetworkErrorView: UIView {
    
    var lbMessage: UILabel!
    var ivIcon: UIImageView!
    var btRefresh: UIButton!
    var container: UIView!
    
    var delegate: NetworkErrorViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(hexString: "#ffffff")
        
        createAll()
        layoutAll()
    }
    
    func createAll() {
        // container
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)
        
        // mensagem
        lbMessage = UILabel()
        lbMessage.textAlignment = NSTextAlignment.center
        lbMessage.textColor = UIColor(hexString: "#333333")
        lbMessage.font = UIFont.boldSystemFont(ofSize: 16)
        lbMessage.numberOfLines = 0
        lbMessage.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(lbMessage)
        
        // ícone
        ivIcon = UIImageView(image: UIImage(named: "NetworkError"))
        ivIcon.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(ivIcon)
        
        // botão de refresh
        btRefresh = UIButton(type: .system)
        btRefresh.layer.cornerRadius = 5
        btRefresh.setTitle("Refresh", for: .normal)
        btRefresh.setTitleColor(UIColor(hexString: "#ffffff"), for: .normal)
        btRefresh.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btRefresh.translatesAutoresizingMaskIntoConstraints = false
        btRefresh.backgroundColor = UIColor(hexString: "#ff3860")
        container.addSubview(btRefresh)
        
        btRefresh.addTarget(self, action: #selector(onBtRefreshTouchUpInside), for: UIControlEvents.touchUpInside)
    }
    
    func layoutAll() {
        addConstraint(NSLayoutConstraint(item: container, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: container, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: container, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 10.0))
        addConstraint(NSLayoutConstraint(item: container, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -10.0))
        
        container.addConstraint(NSLayoutConstraint(item: lbMessage, attribute: .centerX, relatedBy: .equal, toItem: container, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        container.addConstraint(NSLayoutConstraint(item: lbMessage, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0.0))
        container.addConstraint(NSLayoutConstraint(item: lbMessage, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        
        container.addConstraint(NSLayoutConstraint(item: ivIcon, attribute: .centerX, relatedBy: .equal, toItem: container, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        container.addConstraint(NSLayoutConstraint(item: ivIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64.0))
        container.addConstraint(NSLayoutConstraint(item: ivIcon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64.0))
        
        container.addConstraint(NSLayoutConstraint(item: btRefresh, attribute: .centerX, relatedBy: .equal, toItem: container, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        container.addConstraint(NSLayoutConstraint(item: btRefresh, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0.0))
        container.addConstraint(NSLayoutConstraint(item: btRefresh, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        container.addConstraint(NSLayoutConstraint(item: btRefresh, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 44.0))
        
        container.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[ivIcon]-20-[lbMessage]-60-[btRefresh]-|", options: [], metrics: nil, views: [
            "lbMessage": lbMessage,
            "ivIcon": ivIcon,
            "btRefresh": btRefresh
            ]))
    }
    
    @objc func onBtRefreshTouchUpInside(sender: UIButton? = nil) {
        delegate?.networkErrorViewProtocolOnAction(action: .refresh)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
