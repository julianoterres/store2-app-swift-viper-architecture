
import UIKit
@testable import Enjoei

class HomeWorkerSpy: HomeWorkerProtocol {
  
  weak var interactor: HomeWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var api: APIProtocol?
  var functionCalled = false
  var typeFetchPassed: TypeFetchProductsEnum?
  var urlPassed: URL?
  
}

extension HomeWorkerSpy: HomeInteractorToWorkerProtocol {
  
  func fetchProductsInitial() {
    functionCalled = true
  }
  
  func fetchProductsPullToRefresh() {
    functionCalled = true
  }
  
  func fetchProductsPagination() {
    functionCalled = true
  }
  
  func fetchProducts(url: URL, typeFetch: TypeFetchProductsEnum) {
    functionCalled = true
    urlPassed = url
    typeFetchPassed = typeFetch
  }
  
}
