
import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
  
  weak var viewController: UIViewController?
  
  func buildModule() -> UIViewController {
    
    let viewController = HomeViewController()
    let presenter = HomePresenter()
    let interactor = HomeInteractor()
    let worker = HomeWorker()
    let router = HomeRouter()
    let network = Network()
    let api = API()
    viewController.presenter = presenter
    presenter.interactor = interactor
    presenter.viewController = viewController
    presenter.router = router
    interactor.presenter = presenter
    interactor.worker = worker
    worker.interactor = interactor
    worker.network = network
    worker.api = api
    router.viewController = viewController
    return viewController
  }
  
}

extension HomeRouter: HomePresenterToRouterProtocol {
  
  func goToDetails(product: ProductViewEntity) {
    let detailsViewController = DetailRouter().buildModule(product: product)
    viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
  }
  
}
