import Foundation

enum SampleOptionTypeEnum: Int {
    case message = 0
    case audio = 1
    case http = 2
}

enum NetworkErrorViewAction : Int {
    case refresh = 0
}

enum RemoteDataLoadState : Int {
    case loaded = 0
    case loading = 1
    case notLoaded = 2
}
