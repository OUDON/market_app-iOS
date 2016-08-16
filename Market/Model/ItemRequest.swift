import APIKit
import Himotoki

struct ItemRequest: MarketRequestType {
    typealias Response = Item
    let id: Int
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/items/\(id).json"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeValue(object);
    }
}