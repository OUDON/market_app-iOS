import APIKit
import Himotoki

struct RecommendItemsRequest: MarketRequestType {
    typealias Response = [Item]
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/items/recommended.json"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeArray(object);
    }
}