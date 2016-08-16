import Foundation
import Himotoki

struct Category {
    let id: Int
    let name: String
    let imageURL: NSURL
    let categoryItemsURL : NSURL
}

extension Category: Decodable {
    static let URLTransformer = Transformer<String, NSURL> { URLString throws -> NSURL in
        if let URL = NSURL(string: URLString) {
            return URL
        }
        throw customError("Invalid URL string: \(URLString)")
    }
    
    static func decode(e: Extractor) throws -> Category {
        return try Category(id: e <| "id",
                        name: e <| "name",
                        imageURL: URLTransformer.apply(e <| "image_url"),
                        categoryItemsURL: URLTransformer.apply(e <| "category_items_url"))
    }
}