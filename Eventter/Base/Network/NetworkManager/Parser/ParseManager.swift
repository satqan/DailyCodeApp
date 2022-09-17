import Foundation

class ParseManager {

    static let shared = ParseManager()

    let networkManager: NetworkManager = Router(parser: CustomParser())

    private init() {}

    func multipartFormData<T: Decodable>(url: String, parameters: Parameters? = nil, token: String? = nil, successCompletion: @escaping (T) -> (), failureCompletion: @escaping (String) -> ()) -> Void {
        print("LOG_Parameters", parameters as Any, token as Any)

        let endpoint = Endpoints.multipartFormData(url: url, parameters: parameters, token: token)

        networkManager.request(endpoint) { (result: Result<T>) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    failureCompletion(error)
                }
            case .success(let value):
                DispatchQueue.main.async {
                    successCompletion(value)
                }
            }
        }
    }

    func deleteRequest<T: Decodable>(url: String, parameters: Parameters? = nil, token: String? = nil, successCompletion: @escaping (T) -> (), failureCompletion: @escaping (String) -> ()) -> Void {
        print("LOG_Parameters", parameters as Any, token as Any)

        let endpoint = Endpoints.delete(url: url, parameters: parameters, token: token)

        networkManager.request(endpoint) { (result: Result<T>) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    failureCompletion(error)
                }
            case .success(let value):
                DispatchQueue.main.async {
                    successCompletion(value)
                }
            }
        }
    }
    
    func postRequest<T: Decodable>(url: String, parameters: Parameters? = nil, token: String? = nil, successCompletion: @escaping (T) -> (), failureCompletion: @escaping (String) -> ()) -> Void {
        print("LOG_Parameters", parameters as Any, token as Any)

        let endpoint = Endpoints.post(url: url, parameters: parameters, token: token)

        networkManager.request(endpoint) { (result: Result<T>) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    failureCompletion(error)
                }
            case .success(let value):
                DispatchQueue.main.async {
                    successCompletion(value)
                }
            }
        }
    }

    func getRequest<T: Decodable>(url: String, parameters: Parameters? = nil, token: String? = nil, successCompletion: @escaping (T) -> (), failureCompletion: @escaping (String) -> ()) -> Void {
        print("LOG_Parameters", parameters as Any, token as Any)

        let endpoint = Endpoints.get(url: url, parameters: parameters, token: token)

        networkManager.request(endpoint) { (result: Result<T>) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    failureCompletion(error)
                }
            case .success(let value):
                DispatchQueue.main.async {
                    successCompletion(value)
                }
            }
        }
    }
}
