import Foundation

class DateTimeUtil {
    
    static func getCurrentTimeStamp() -> TimeInterval {
        return Date().timeIntervalSince1970
    }
    
    static func formatAsMysql(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    
    static func formatAsDeviceSettings(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }
    
    static func formatAsUnixEpoch(date: Date) -> String {
        return "\(date.timeIntervalSince1970)"
    }
    
}
