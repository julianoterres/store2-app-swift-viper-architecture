
import UIKit

protocol HomePresenterProtocol: class {
  var viewController: HomePresenterToViewControllerProtocol? { get set }
}

protocol HomeViewControllerToPresenterProtocol: class {
  func fetchProducts(typeFetch: TypeFetchProductsEnum)
  func didSelectProduct(product: ProductViewEntity)
}

protocol HomePresenterToViewControllerProtocol: class {
  func addFetchedProductsBottom(productsView: [ProductViewEntity])
  func addFetchedProductsTop(productsView: [ProductViewEntity])
  func showAlertError(message: String)
}

protocol HomePresenterToRouterProtocol: class {
  func goToDetails(product: ProductViewEntity)
}

protocol HomeInteractorProtocol: class {
  var presenter: HomeInteractorToPresenterProtocol? { get set }
}

protocol HomePresenterToInteractorProtocol: class {
  func fetchProducts(typeFetch: TypeFetchProductsEnum)
}

protocol HomeInteractorToPresenterProtocol: class {
  func fetchedProducts(produtcts: [ProductViewEntity], typeFetch: TypeFetchProductsEnum)
  func fetchedDealsFail(message: String)
}

protocol HomeWorkerProtocol: class {
  var interactor: HomeWorkerToInteractorProtocol? { get set }
  var network: NetworkProtocol? { get set }
  func fetchProducts(url: URL, typeFetch: TypeFetchProductsEnum)
}

protocol HomeInteractorToWorkerProtocol: class {
  func fetchProductsInitial()
  func fetchProductsPagination()
  func fetchProductsPullToRefresh()
}

protocol HomeWorkerToInteractorProtocol: class {
  func fetchedProducts(response: ProductsResponseApiEntity, typeFetch: TypeFetchProductsEnum)
  func fetchedDealsFail(message: String)
}

protocol HomeRouterProtocol: class {
  var viewController: UIViewController? { get set }
  func buildModule() -> UIViewController
}
