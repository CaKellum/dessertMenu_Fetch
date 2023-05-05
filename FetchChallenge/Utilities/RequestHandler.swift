import Combine
import Foundation

enum RequestType: String {
    case get = "GET", post = "POST", put = "PUT", delete = "DELETE"
}

struct Request {
    public typealias RequestResultHandler = (Data?, URLResponse?, Error?) -> Void
    let type: RequestType
    let url: URL
    let handler: RequestResultHandler?

    init(type: RequestType = .get, url: URL, handler: @escaping RequestResultHandler) {
        self.handler = handler
        self.url = url
        self.type = type
    }
}

struct RequestManager {

    static let defaultErrorMessage = "Error getting object"
    static let forbidenMessage = "Content is Forbiden"
    static let notFoundMessage = "Object Not Found"

    static func makeRequest(request: Request) {
        var dataRequest = URLRequest(url: request.url)
        dataRequest.httpMethod = request.type.rawValue
        let task = URLSession.shared.dataTask(with: dataRequest) { recivedData, response, error in
            if let handler = request.handler {
                handler(recivedData, response, error)
            }
        }
        task.resume()
    }

    static func getErrorDescripton(error: Error, response: URLResponse?) -> String {
        guard let response = response as? HTTPURLResponse else { return Self.defaultErrorMessage }
        switch response.statusCode {
        case 400...499: return Self.notFoundMessage
        case 500...599: return Self.forbidenMessage
        default: return Self.defaultErrorMessage
        }
    }

}
