import Foundation

class Response<T: Decodable>: Decodable {
//    let status_code: Int
    let message: String
    let result: T?
}
