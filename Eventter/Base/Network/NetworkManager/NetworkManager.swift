import Foundation

protocol NetworkManager {
    func request<T: Decodable>(_ route: EndpointType, completion: @escaping (Result<T>) -> Void)
    func cancel()
}

