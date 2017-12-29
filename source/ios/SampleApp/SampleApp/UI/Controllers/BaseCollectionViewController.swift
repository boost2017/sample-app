import Foundation
import UIKit

class BaseCollectionViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    
    override func createAll() {
        super.createAll()
        
        // collection view
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = getCollectionViewItemSize()
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(hexString: "#ffffff")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = getCollectionViewContentInset()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onCollectionViewTappedChecker))
        tapGesture.numberOfTapsRequired = 1
        collectionView.addGestureRecognizer(tapGesture)
        
        view.addSubview(collectionView)
    }
    
    override func layoutAll() {
        super.layoutAll()
        
        // collection view
        view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0))
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onCollectionViewGetNumberOfItems(collectionView: collectionView, section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onCollectionViewCreateCell(collectionView: collectionView, indexPath: indexPath)
        bindEventsOnCell(cell: cell, index: Int(indexPath.row))        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCellSelected(indexPath: indexPath)
    }
    
    func bindEventsOnCell(cell: UICollectionViewCell, index: Int) {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(onCellLongPressGesture))
        cell.addGestureRecognizer(longPressGesture)
    }
    
    override func networkErrorViewProtocolOnAction(action: NetworkErrorViewAction) {
        super.networkErrorViewProtocolOnAction(action: action)
        
        if action == .refresh {
            if remoteDataLoadState != .loading {
                remoteDataLoadState = .notLoaded
            }
            
            loadData()
        }
    }
    
    override func getVCTitle() -> String {
        return "BaseTableView"
    }
    
    @objc func onCellLongPressGesture(sender: UILongPressGestureRecognizer) {
        if sender.state != .began {
            return
        }
        
        let tapLocation = sender.location(in: collectionView)
        
        if let indexPath = collectionView?.indexPathForItem(at: tapLocation) {
            onCellLongPress(indexPath: indexPath)
        }
    }
    
    // MARK: EVENTS
    
    func onCellLongPress(indexPath: IndexPath) {
        // Need be implemented on child
    }
    
    @objc func onCollectionViewTappedChecker(sender: UITapGestureRecognizer) {
        if let indexPath = collectionView.indexPathForItem(at: sender.location(in: collectionView)) {
            onCellSelected(indexPath: indexPath)
        } else {
            onCollectionViewTapped()
        }
    }
    
    func onCellSelected(indexPath: IndexPath) {
        // Need be implemented on child
    }
    
    func onCollectionViewTapped() {
        dismissKeyboard()
    }
    
    func getCollectionViewItemSize() -> CGSize {
        return CGSize(width: 120, height: 230)
    }
    
    func getCollectionViewContentInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func onCollectionViewCreateCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        // Need be implemented on child
        return UICollectionViewCell()
    }
    
    func onCollectionViewGetNumberOfItems(collectionView: UICollectionView, section: Int) -> Int {
        // Need be implemented on child
        return 0
    }
    
    func onCollectionViewSelectedCell(collectionView: UICollectionView, indexPath: IndexPath) {
        // Need be implemented on child
    }
    
    // MARK: CACHE
    
    override func onCacheExpired() {
        super.onCacheExpired()
        
        if remoteDataLoadState != .loading {
            remoteDataLoadState = .notLoaded
        }
        
        loadData()
    }
    
}

