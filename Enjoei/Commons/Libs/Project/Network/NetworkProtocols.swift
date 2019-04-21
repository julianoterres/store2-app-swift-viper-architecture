
import Alamofire

protocol NetworkProtocol {
  func request(url: URL, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping(_ error: String) -> Void)
}
