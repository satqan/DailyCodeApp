import Foundation

public protocol Parser {
    func parse<T: Decodable>(data: Data?, response: URLResponse?, error: Error?) -> Result<T>
}

public class CustomParser: Parser {
    public init() {}
    
    public func parse<T>(data: Data?, response: URLResponse?, error: Error?) -> Result<T> where T : Decodable {
        if let error = error {
            return .failure(error.localizedDescription)
        }
        guard let response = response as? HTTPURLResponse else { return .failure("Response is not in HTTPResponse format") }
        
        
        switch response.statusCode {
        case 200...499:
            guard let data = data else { return .failure(NetworkResponse.noData.rawValue) }

            checkForJson(data)

            return decode(data)
        case 300...399:
            return .failure(NetworkResponse.redirect.rawValue)
        case 401:
            return .failure(NetworkResponse.tokenExpire.rawValue)
        case 500...501:
            return .failure(NetworkResponse.internalServerError.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }

    private func decode<T: Decodable>(_ data: Data) -> Result<T> {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(T.self, from: data)
            return Result.success(response)
        } catch let DecodingError.dataCorrupted(context) {
            return .failure(context.debugDescription)
        } catch let DecodingError.keyNotFound(key, context) {
            return .failure("Key '\(key)' not found: \(context.debugDescription)\ncodingPath: \(context.codingPath)")
        } catch let DecodingError.valueNotFound(value, context) {
            return .failure("Value '\(value)' not found: \(context.debugDescription)\ncodingPath: \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context)  {
            return .failure("Type '\(type)' mismatch: \(context.debugDescription)\ncodingPath: \(context.codingPath)")
        } catch {
            if let message = try? decoder.decode(String.self, from: data) {
                return Result.failure(message)
            }
            return .failure(error.localizedDescription)
        }
    }

    private func checkForJson(_ data: Data) -> Void {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
        } catch {
            print("Error json: ", error.localizedDescription)
        }
    }
}
