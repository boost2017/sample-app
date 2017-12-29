import UIKit

class MainViewController: BaseTableViewController {

    let cellIdentifier = "CellIdentifier"
    var tableViewData: [SampleOption]!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func showMessage(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func doActionHTTP(tableView: UITableView, indexPath: IndexPath) {
        guard
            let http = EZRHttpClientBridge.sharedInstance(),
            let cell = tableView.cellForRow(at: indexPath) as? SampleOptionTableViewCell else {
                return
        }
        
        http.setPlatformService(EZRHttpClientPlatformServiceImpl())
        
        let oldText = cell.lbDescription.text
        cell.lbDescription.text = "Loading..."
        
        DispatchQueue.global(qos: .background).async {
            let response = http.doGet("https://httpbin.org/delay/3")
            
            //let response = http.doGet("https://httpbin.org/get")
            //let response = http.doHead("https://httpbin.org/head")
            //let response = http.doPost("https://httpbin.org/post", data: "{\"username\": \"demo\", \"password\": \"demo\"}", contentType: "application/json")
            //let response = http.doPut("https://httpbin.org/put", data: "{\"username\": \"demo\", \"password\": \"demo\"}", contentType: "application/json")
            //let response = http.doPatch("https://httpbin.org/patch", data: "{\"username\": \"demo\", \"password\": \"demo\"}", contentType: "application/json")
            //let response = http.doDelete("https://httpbin.org/delete", data: "{\"username\": \"demo\", \"password\": \"demo\"}", contentType: "application/json")
            
            DispatchQueue.main.async {
                self.showMessage(message: "Status: \(response.code)\n\nMessage: \(response.body)")
                cell.lbDescription.text = oldText
            }
        }
    }
    
    func doActionMessage(tableView: UITableView, indexPath: IndexPath) {
        guard
            let gm = EZRGreetingMessageBridge.sharedInstance(),
            let cell = tableView.cellForRow(at: indexPath) as? SampleOptionTableViewCell else {
                return
        }
        
        gm.setPlatformService(EZRGreetingMessagePlatformServiceImpl())
        
        let oldText = cell.lbDescription.text
        cell.lbDescription.text = "Loading..."
        
        DispatchQueue.global(qos: .background).async {
            gm.setMessage("Test")
            gm.printMessage()
            
            DispatchQueue.main.async {
                cell.lbDescription.text = oldText
                gm.showGreetingMessageAlert("Native alert", message: gm.getMessage())
            }
        }
    }
    
    func doActionAudio(tableView: UITableView, indexPath: IndexPath) {
        DispatchQueue.global(qos: .background).async {
            guard let audio = EZRAudioStreamerBridge.sharedInstance() else {
                return
            }
            
            if audio.getPlatformService() == nil {
                audio.setPlatformService(EZRAudioStreamerPlatformServiceImpl())
                audio.setUrl("https://www.ezored.com/extras/audio/sample-music.mp3")
            }
            
            let isPlaying = audio.isPlaying()
            
            if isPlaying {
                audio.pause()
            } else {
                audio.play()
            }
        }
    }
    
    // MARK: EVENTS
    
    override func createAll() {
        super.createAll()
        
        // register cells
        tableView.register(SampleOptionTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
    }
    
    override func getVCTitle() -> String {
        return "EzoRed Sample App"
    }
    
    override func getTitleForAnalytics() -> String {
        return "EzoRed Sample App"
    }
    
    override func needLoadNewData() -> Bool {
        return true
    }
    
    override func onLoadNewData() {
        super.onLoadNewData()
        
        DispatchQueue.main.async {
            self.showLoadingView(show: true)
        }
        
        tableViewData = [SampleOption]()
        
        tableViewData.append(SampleOption(type: .message, hasSeparator: true))
        tableViewData.append(SampleOption(type: .audio, hasSeparator: true))
        tableViewData.append(SampleOption(type: .http, hasSeparator: false))
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.showMainView()
            self.remoteDataLoadState = .loaded
        }
    }
    
    override func onTableViewCreateCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let sampleOption = tableViewData![indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SampleOptionTableViewCell
        cell.bind(sampleOption: sampleOption)
        
        return cell
    }
    
    override func onTableViewGetNumberOfRows(tableView: UITableView, section: Int) -> Int {
        if let tableViewData = tableViewData {
            return tableViewData.count
        }
        
        return 0
    }
    
    override func onTableViewSelectedRow(tableView: UITableView, indexPath: IndexPath) {
        let sampleOption = tableViewData![indexPath.row]
        
        if sampleOption.type == .message {
            doActionMessage(tableView: tableView, indexPath: indexPath)
        } else if sampleOption.type == .audio {
            doActionAudio(tableView: tableView, indexPath: indexPath)
        } else if sampleOption.type == .http {
            doActionHTTP(tableView: tableView, indexPath: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    // MARK: CACHE
    
    override func hasCache() -> Bool {
        return true
    }
    
}

