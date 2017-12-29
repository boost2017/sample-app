import Foundation
import UIKit

class UIUtil {
    
    static func setNavBarStyle(nb: UINavigationBar?) {
        nb?.barTintColor = UIColor(hexString: "#ff3860")
        nb?.tintColor = UIColor(hexString: "#ffffff")
        nb?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(hexString: "#ffffff")!]
        nb?.barStyle = .blackOpaque
        nb?.isTranslucent = false
    }
    
    static func openExternalURL(url: String) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(URL(string: url)!)
        }
    }
    
    static func isPresentedViewController(viewController: UIViewController?) -> Bool {
        if let viewController = viewController {
            if let _ = viewController.presentingViewController {
                return true
            }
            
            if viewController.navigationController?.presentingViewController?.presentedViewController == viewController {
                return true
            }
            
            if viewController.tabBarController?.presentingViewController is UITabBarController {
                return true
            }
        }
        
        return false
    }
    
}
