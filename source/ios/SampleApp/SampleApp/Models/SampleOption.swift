import Foundation
import UIKit

class SampleOption {
    
    var type: SampleOptionTypeEnum!
    var hasSeparator: Bool!
    
    init(type: SampleOptionTypeEnum, hasSeparator: Bool) {
        self.type = type
        self.hasSeparator = hasSeparator
    }
    
    func getDescription() -> String {
        if type == .message {
            return "Message"
        } else if type == .audio {
            return "Media > Audio Streamer"
        } else if type == .http {
            return "HTTP > HTTP Client"
        }
        
        return ""
    }
    
    func getImage() -> UIImage {
        if type == .message {
            return UIImage(named: "SampleOptionMessage")!.withRenderingMode(.alwaysTemplate)
        } else if type == .audio {
            return UIImage(named: "SampleOptionAudio")!.withRenderingMode(.alwaysTemplate)
        } else if type == .http {
            return UIImage(named: "SampleOptionHttp")!.withRenderingMode(.alwaysTemplate)
        }
        
        return UIImage()
    }
    
}
