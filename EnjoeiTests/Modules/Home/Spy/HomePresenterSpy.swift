
import UIKit
@testable import Enjoei

class HomePresenterSpy: HomePresenterProtocol {
  
  weak var viewController: HomePresenterToViewControllerProtocol?
  var interactor: HomePresenterToInteractorProtocol?
  var router: HomePresenterToRouterProtocol?
  var functionCalled = false
  var typeFetchPassed: TypeFetchProductsEnum?
  var contentPassedRouter: ProductViewEntity?
  var contentPassedViewController: [ProductViewEntity]?
  var messageErrorPassed: String?
  
}

extension HomePresenterSpy: HomeViewControllerToPresenterProtocol {
  
  func fetchProducts(typeFetch: TypeFetchProductsEnum) {
    functionCalled = true
    typeFetchPassed = typeFetch
  }
  
  func didSelectProduct(product: ProductViewEntity) {
    functionCalled = true
    contentPassedRouter = product
    
  }
  
}

extension HomePresenterSpy: HomeInteractorToPresenterProtocol {
  
  func fetchedProducts(produtcts: [ProductViewEntity], typeFetch: TypeFetchProductsEnum) {
    functionCalled = true
    typeFetchPassed = typeFetch
    contentPassedViewController = produtcts
  }
  
  func fetchedProductsFail(message: String) {
    functionCalled = true
    messageErrorPassed = message
  }
  
}
