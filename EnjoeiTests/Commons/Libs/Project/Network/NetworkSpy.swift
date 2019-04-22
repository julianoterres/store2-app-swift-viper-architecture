
import Alamofire
@testable import Enjoei

class NetworkSuccessSpy: NetworkProtocol {
  
  func request(url: URL, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    success(Data())
  }
  
}

class NetworkProductPhotosApiEntitySuccessSpy: NetworkProtocol {
  
  func request(url: URL, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    do {
      let path = Bundle.main.path(forResource: "ProductsRequestSpy", ofType: "json")!
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
      success(data)
    } catch {
      failure("Message Error")
    }
  }
  
}


class NetworkFailSpy: NetworkProtocol {
  
  func request(url: URL, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    failure("Message Error")
  }
  
}
