
import Foundation
import UIKit

class DetailRouter {
  
  weak var viewController: UIViewController?
  
  func buildModule(product: ProductViewEntity) -> UIViewController {
    let viewController = DetailViewController()
    viewController.product = product
    return viewController
  }
  
}
