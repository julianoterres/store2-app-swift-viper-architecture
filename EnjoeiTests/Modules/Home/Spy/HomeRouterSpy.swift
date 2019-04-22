
import UIKit
@testable import Enjoei

class HomeRouterSpy: HomeRouterProtocol {
  
  weak var viewController: UIViewController?
  var functionCalled = false
  var productPassed: ProductViewEntity?
  
  func buildModule() -> UIViewController {
    return UIViewController()
  }
  
}

extension HomeRouterSpy: HomePresenterToRouterProtocol {
  
  func goToDetails(product: ProductViewEntity) {
    functionCalled = true
    productPassed = product
  }
  
}
