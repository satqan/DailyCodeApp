import Foundation

public enum Result<T: Decodable> {
    case failure(String)
    case success(T)
}
