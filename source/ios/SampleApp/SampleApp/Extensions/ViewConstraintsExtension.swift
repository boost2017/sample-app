import Foundation
import UIKit

/*
 Example: addConstraintsWithFormat(format: "V:|[v0][v1(1)]|", views: collectionView, dividerLine)
 */

public extension UIView {
    
    func addConstraintsWithFormat(format:String, views: UIView...) {
        var viewsDictionary = [String:UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}
