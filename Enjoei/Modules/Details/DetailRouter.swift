
import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
  
  func buildModule(product: ProductViewEntity) -> UIViewController {
    let viewController = DetailViewController()
    viewController.product = product
    return viewController
  }
  
}
