
import UIKit
@testable import Enjoei

class HomeInteractorSpy: HomeInteractorProtocol {
  
  weak var presenter: HomeInteractorToPresenterProtocol?
  var worker: HomeInteractorToWorkerProtocol?
  var functionCalled = false
  var typeFetchPassed: TypeFetchProductsEnum?
  var responsePassed: ProductsResponseApiEntity?
  var messageErrorPassed: String?
  
}

extension HomeInteractorSpy: HomePresenterToInteractorProtocol {
  
  func fetchProducts(typeFetch: TypeFetchProductsEnum) {
    functionCalled = true
    typeFetchPassed = typeFetch
  }
  
}

extension HomeInteractorSpy: HomeWorkerToInteractorProtocol {
  
  func fetchedProducts(response: ProductsResponseApiEntity, typeFetch: TypeFetchProductsEnum) {
    functionCalled = true
    responsePassed = response
    typeFetchPassed = typeFetch
  }
  
  func fetchedProductsFail(message: String) {
    functionCalled = true
    messageErrorPassed = message
    
  }
  
}
