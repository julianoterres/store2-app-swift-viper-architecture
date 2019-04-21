
import Foundation

class HomeWorker: HomeWorkerProtocol {
  
  weak var interactor: HomeWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var api: APIProtocol?
  
}

extension HomeWorker: HomeInteractorToWorkerProtocol {
  
  func fetchProductsInitial() {
    guard let url = api?.urlInitial else {
      interactor?.fetchedDealsFail(message: "Error to get url api")
      return
    }
    fetchProducts(url: url, typeFetch: .initial)
  }
  
  func fetchProductsPullToRefresh() {
    guard let url = api?.urlPullRefresh else {
      interactor?.fetchedDealsFail(message: "Error to get url api")
      return
    }
    fetchProducts(url: url, typeFetch: .pullToRefresh)
  }
  
  func fetchProductsPagination() {
    guard let url = api?.urlPagination else {
      interactor?.fetchedDealsFail(message: "Error to get url api")
      return
    }
    fetchProducts(url: url, typeFetch: .pagination)
  }
  
  func fetchProducts(url: URL, typeFetch: TypeFetchProductsEnum) {
    network?.request(url: url, method: .get, parameters: nil, success: { (response) in
      do {
        let productsResponseApi = try JSONDecoder().decode(ProductsResponseApiEntity.self, from: response)
        self.interactor?.fetchedProducts(response: productsResponseApi, typeFetch: typeFetch)
      } catch let error {
        self.interactor?.fetchedDealsFail(message: error.localizedDescription)
      }
    }, failure: { (error) in
      self.interactor?.fetchedDealsFail(message: error)
    })
  }
  
}
