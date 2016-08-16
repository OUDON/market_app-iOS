import Foundation
import APIKit

protocol MarketRequestType: RequestType {}

extension MarketRequestType {
    var baseURL: NSURL {
        return NSURL(string: "http://localhost:3000")!
    }
}

