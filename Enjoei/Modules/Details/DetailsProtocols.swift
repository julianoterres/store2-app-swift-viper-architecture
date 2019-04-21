
import UIKit

protocol DetailRouterProtocol: class {
  func buildModule(product: ProductViewEntity) -> UIViewController
}
