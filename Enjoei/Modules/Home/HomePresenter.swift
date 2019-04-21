
class HomePresenter: HomePresenterProtocol {
  
  weak var viewController: HomePresenterToViewControllerProtocol?
  var interactor: HomePresenterToInteractorProtocol?
  var router: HomePresenterToRouterProtocol?
  
}

extension HomePresenter: HomeViewControllerToPresenterProtocol {
  
  func fetchProducts(typeFetch: TypeFetchProductsEnum) {
    interactor?.fetchProducts(typeFetch: typeFetch)
  }
  
  func didSelectProduct(product: ProductViewEntity) {
    router?.goToDetails(product: product)
  }
  
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
  
  func fetchedProducts(produtcts: [ProductViewEntity], typeFetch: TypeFetchProductsEnum) {
    if typeFetch == .pullToRefresh {
      viewController?.addFetchedProductsTop(productsView: produtcts)
    } else {
      viewController?.addFetchedProductsBottom(productsView: produtcts)
    }
  }
  
  func fetchedDealsFail(message: String) {
    
  }
  
}
