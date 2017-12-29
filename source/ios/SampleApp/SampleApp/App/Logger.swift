import Foundation

class Logger {
    
    static func debug(prefix: String, format: String, args: [CVarArg]) {
        let message: String
        
        if args.count == 0 {
            message = format
        } else {
            message = String(format: format, arguments: args)
        }
        
        print("\(prefix)\(message)")
    }
    
    static func v(_ format: String, _ args: CVarArg...) {
        debug(prefix: "💜 ", format: format, args: args)
    }
    
    static func d(_ format: String, _ args: CVarArg...) {
        debug(prefix: "💚 ", format: format, args: args)
    }
    
    static func w(_ format: String, _ args: CVarArg...) {
        debug(prefix: "💛 ", format: format, args: args)
    }
    
    static func i(_ format: String, _ args: CVarArg...) {
        debug(prefix: "💙 ", format: format, args: args)
    }
    
    static func e(_ format: String, _ args: CVarArg...) {
        debug(prefix: "❤️ ", format: format, args: args)
    }
    
}
