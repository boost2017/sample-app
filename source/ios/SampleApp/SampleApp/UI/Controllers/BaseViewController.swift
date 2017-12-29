import UIKit

class BaseViewController: UIViewController, NetworkErrorViewProtocol {
    
    var errorView: ErrorView!
    var loadingView: LoadingView!
    var networkErrorView: NetworkErrorView!
    
    var lastCacheUpdate: TimeInterval?
    
    var remoteDataLoadState: RemoteDataLoadState = .notLoaded
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAll()
        updateTheme()
        layoutAll()
        loadData()
    }
    
    func createAll() {
        // controller
        UIUtil.setNavBarStyle(nb: navigationController?.navigationBar)
        
        // view
        createMainContainerView()
        
        // error view
        errorView = ErrorView()
        errorView.translatesAutoresizingMaskIntoConstraints = false
        getMainContainerView().addSubview(errorView)
        showErrorView(show: false, message: "")
        
        // loading view
        loadingView = LoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        getMainContainerView().addSubview(loadingView)
        showLoadingView(show: false)
        
        // network error view
        networkErrorView = NetworkErrorView()
        networkErrorView.delegate = self
        networkErrorView.translatesAutoresizingMaskIntoConstraints = false
        getMainContainerView().addSubview(networkErrorView)
        showNetworkErrorView(show: false, message: "")
    }
    
    func layoutAll() {
        // error view
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[errorView]-0-|", options: [], metrics: nil, views: [
            "errorView": errorView
            ]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-0-[errorView]-0-[bottomLayoutGuide]", options: [], metrics: nil, views: [
            "errorView": errorView,
            "topLayoutGuide": topLayoutGuide,
            "bottomLayoutGuide": bottomLayoutGuide
            ]))
        
        // loading view
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[loadingView]-0-|", options: [], metrics: nil, views: [
            "loadingView": loadingView
            ]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-0-[loadingView]-0-[bottomLayoutGuide]", options: [], metrics: nil, views: [
            "loadingView": loadingView,
            "topLayoutGuide": topLayoutGuide,
            "bottomLayoutGuide": bottomLayoutGuide
            ]))
        
        // network error view
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[networkErrorView]-0-|", options: [], metrics: nil, views: [
            "networkErrorView": networkErrorView
            ]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-0-[networkErrorView]-0-[bottomLayoutGuide]", options: [], metrics: nil, views: [
            "networkErrorView": networkErrorView,
            "topLayoutGuide": topLayoutGuide,
            "bottomLayoutGuide": bottomLayoutGuide
            ]))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = getVCTitle()
        
        validateLoadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        onDeviceOrientationChanged()
    }
    
    func dismissKeyboard() {
        getMainContainerView().resignFirstResponder()
        getMainContainerView().endEditing(true)
    }
    
    @objc func onNotificationReset(notification: NSNotification) {
        if remoteDataLoadState != .loading {
            remoteDataLoadState = .notLoaded
        }
    }
    
    @objc func onNotificationThemeChanged(notification: Notification) {
        updateTheme()
    }
    
    // MARK: EVENTS
    
    func getTitleForAnalytics() -> String {
        return "Base"
    }
    
    func getVCTitle() -> String {
        return "Base"
    }
    
    func validateLoadData() {
        validateCache()
        loadData()
    }
    
    func needLoadNewData() -> Bool {
        return false
    }
    
    func onLoadNewData() {
        // Need be implemented on child
    }
    
    func loadData() {
        if !needLoadNewData() {
            return
        }
        
        if remoteDataLoadState != .notLoaded {
            return
        }
        
        remoteDataLoadState = .loading
        
        onLoadNewData()
    }
    
    func updateTheme() {
        // Need be implemented on child
    }
    
    func onDeviceOrientationChanged() {
        // Need be implemented on child
    }
    
    // MARK: VIEWS
    
    func showErrorView(show: Bool, message: String) {
        if show {
            hideAllViews()
            errorView.lbMessage.text = message
            view.bringSubview(toFront: errorView)
            errorView.isHidden = false
            errorView.setNeedsLayout()
        } else {
            errorView.isHidden = true
        }
    }
    
    func showLoadingView(show: Bool) {
        if show {
            hideAllViews()
            view.bringSubview(toFront: loadingView)
            loadingView.visibilityChanged(visible: true)
            loadingView.isHidden = false
            loadingView.setNeedsLayout()
        } else {
            loadingView.isHidden = true
            loadingView.visibilityChanged(visible: false)
        }
    }
    
    func showNetworkErrorView(show: Bool, message: String) {
        if show {
            hideAllViews()
            networkErrorView.lbMessage.text = message
            view.bringSubview(toFront: networkErrorView)
            networkErrorView.isHidden = false
            networkErrorView.setNeedsLayout()
        } else {
            networkErrorView.isHidden = true
        }
    }
    
    func showMainView() {
        getMainContainerView().setNeedsLayout()
        hideAllViews()
    }
    
    func hideAllViews() {
        errorView.isHidden = true
        loadingView.isHidden = true
        networkErrorView.isHidden = true
    }
    
    func createMainContainerView() {
        view.backgroundColor = UIColor(hexString: "#ffffff")
    }
    
    func getMainContainerView() -> UIView {
        return view
    }
    
    func networkErrorViewProtocolOnAction(action: NetworkErrorViewAction) {
        // Need be implemented on child
        Logger.i("NetworkErrorView: Action executed")
    }
    
    // MARK: BUTTON BACK
    
    func createBackButton() {
        let image = UIImage(named: "BtBack")?.imageWithColor(color: UIColor(hexString: "#ffffff")!)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: -2, y: 0, width: 40, height: 40)
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(onBackButtonTouchUpInside), for: .touchUpInside)
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        container.addSubview(button)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: container)
        navigationItem.hidesBackButton = true
    }
    
    @objc func onBackButtonTouchUpInside(button: UIButton) {
        // Need be implemented on child
        if UIUtil.isPresentedViewController(viewController: self) {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: CACHE
    
    func hasCache() -> Bool {
        return false
    }
    
    func cacheExpireInterval() -> TimeInterval {
        return TimeInterval(0)
    }
    
    func validateCache() {
        if hasCache() {
            lastCacheUpdate = lastCacheUpdate ?? DateTimeUtil.getCurrentTimeStamp()
            
            let currentTime = DateTimeUtil.getCurrentTimeStamp()
            let expireTime = lastCacheUpdate! + cacheExpireInterval()
            
            if currentTime >= expireTime {
                lastCacheUpdate = DateTimeUtil.getCurrentTimeStamp()
                onCacheExpired()
            }
        }
    }
    
    func onCacheExpired() {
        Logger.i("Cache expired!")
        // Need be implemented on child
    }
    
}

