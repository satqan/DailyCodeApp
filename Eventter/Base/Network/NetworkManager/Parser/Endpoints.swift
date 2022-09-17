import Foundation

enum Endpoints: EndpointType {

    case get(url: String, parameters: Parameters?, token: String?)
    case post(url: String, parameters: Parameters?, token: String?)
    case delete(url: String, parameters: Parameters?, token: String?)
    case multipartFormData(url: String, parameters: Parameters?, token: String?)
    
    var baseUrl: URL {
        return URL(string: "\(ApiUrls.baseURL)")!
    }
    
    var path: String {
        switch self {
        case .get(let url, _, _):
            return url
        case .post(let url, _, _):
            return url
        case .delete(let url, _, _):
            return url
        case .multipartFormData(let url, _, _):
            return url
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .get(_, _, _):
            return .get
        case .post(_, _, _):
            return .post
        case .delete(_, _, _):
            return .delete
        case .multipartFormData(_, _, _):
            return .post
        }
    }

    var task: HTTPTask {
        switch self {
        case .get(_, let parameters, let token):
            var urlParameters: Parameters = [:]
            var headers: HTTPHeaders = [:]
            if let params = parameters {
                urlParameters = params
            }
            if let token = token {
                headers["Authorization"] = "Bearer \(token)"
            }
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: urlParameters, additionalHeaders: headers)
        case .post(_, let parameters, let token):
            var bodyParameters: Parameters = [:]
            var headers: HTTPHeaders = [:]
            if let params = parameters {
                bodyParameters = params
            }
            if let token = token {
                headers["Authorization"] = "Bearer \(token)"
            }
            return .requestParametersAndHeaders(bodyParameters: bodyParameters, urlParameters: nil, additionalHeaders: headers)
        case .delete(_, let parameters, let token):
            var bodyParameters: Parameters = [:]
            var headers: HTTPHeaders = [:]
            if let params = parameters {
                bodyParameters = params
            }
            if let token = token {
                headers["Authorization"] = "Bearer \(token)"
            }
            return .requestParametersAndHeaders(bodyParameters: bodyParameters, urlParameters: nil, additionalHeaders: headers)
        case let .multipartFormData(_, parameters, token):
            var bodyParameters: Parameters = [:]
            var headers: HTTPHeaders = [:]
            if let params = parameters {
                bodyParameters = params
            }
            if let token = token {
                headers["Authorization"] = "Bearer \(token)"
            }
            return .multipartFormData(bodyParameters: bodyParameters, urlParameters: nil, additionalHeader: headers)
        }

    }


}
