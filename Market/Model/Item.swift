import Foundation
import Himotoki

struct Item {
    let id: Int
    let name: String
    let desc: String
    let price: Int
    let imageURL: NSURL
}

extension Item: Decodable {
    static let URLTransformer = Transformer<String, NSURL> { URLString throws -> NSURL in
        if let URL = NSURL(string: URLString) {
            return URL
        }
        throw customError("Invalid URL string: \(URLString)")
    }
    
    static func decode(e: Extractor) throws -> Item {
        return try Item(id: e <| "id",
                        name: e <| "name",
                        desc: e <| "description",
                        price: e <| "price",
                        imageURL: URLTransformer.apply(e <| "image_url"))
    }
}