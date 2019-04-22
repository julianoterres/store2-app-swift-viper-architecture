
import UIKit
@testable import Enjoei

class HomeViewControllerSpy: HomePresenterToViewControllerProtocol {
  
  var functionCalled = false
  var contentPassed: [ProductViewEntity]?
  var messageErrorPassed: String?
  
  func addFetchedProductsBottom(productsView: [ProductViewEntity]) {
    functionCalled = true
    contentPassed = productsView
  }
  
  func addFetchedProductsTop(productsView: [ProductViewEntity]) {
    functionCalled = true
    contentPassed = productsView
  }
  
  func showAlertError(message: String) {
    functionCalled = true
    messageErrorPassed = message
  }
  
  
}

