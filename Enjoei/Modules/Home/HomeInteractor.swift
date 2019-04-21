
import Foundation

class HomeInteractor: HomeInteractorProtocol {
  
  weak var presenter: HomeInteractorToPresenterProtocol?
  var worker: HomeInteractorToWorkerProtocol?
  var fetchProductsActive = false
  
}

extension HomeInteractor: HomePresenterToInteractorProtocol {
  
  func fetchProducts(typeFetch: TypeFetchProductsEnum) {
    guard !fetchProductsActive else { return }
    fetchProductsActive = true
    switch typeFetch {
    case .initial:
      worker?.fetchProductsInitial()
    case .pullToRefresh:
      worker?.fetchProductsPullToRefresh()
    default:
      worker?.fetchProductsPagination()
    }
  }
  
}

extension HomeInteractor: HomeWorkerToInteractorProtocol {
  
  func fetchedProducts(response: ProductsResponseApiEntity, typeFetch: TypeFetchProductsEnum) {
    let products = response.products.map({ (product) -> ProductViewEntity in
      
      var userImage: URL?, imageDefault: URL?, discount: String?, price: String?, priceFinal: String?, installments: String?
      var images: [URL?] = []
      
      if let originalPrice = product.original_price_integer, let originalFriceFinal = product.price {
        if originalPrice != originalFriceFinal {
          price = originalPrice.currency
        }
        priceFinal = originalFriceFinal.currency
      }
      
      if let photoDefaultId = product.default_photo?.image_public_id {
        imageDefault = URL(string: PhotosBaseUrlEnum.size180x180.rawValue + photoDefaultId)
      }
      
      if let photos = product.photos {
        images = photos.filter({ $0.image_public_id != nil }).map({ (photo) -> URL? in
          if imageDefault == nil {
            imageDefault = URL(string: PhotosBaseUrlEnum.size180x180.rawValue + photo.image_public_id!)
          }
          return URL(string: PhotosBaseUrlEnum.size_460x460.rawValue + photo.image_public_id!)
        })
      }
      
      if let userImageId = product.user?.avatar?.image_public_id {
        userImage = URL(string: PhotosBaseUrlEnum.size180x180.rawValue + userImageId)
      }
      
      if let discountValue = product.discount_percentage, discountValue > 0  {
        installments = String(discountValue) + "% "
        discount = "-" + String(discountValue) + "%"
      }
      
      if let qtyInstallments = product.maximum_installment {
        installments = (installments ?? "") + "EM ATÉ \(qtyInstallments)X"
      }
      
      return ProductViewEntity(
        discount: discount,
        imageDefault: imageDefault,
        images: images,
        likes: String(product.likes_count ?? 0),
        price: price,
        priceFinal: priceFinal,
        installmentText: installments,
        title: product.title,
        userImage: userImage
      )
    })
    fetchProductsActive = false
    presenter?.fetchedProducts(produtcts: products, typeFetch: typeFetch)
  }
  
  func fetchedDealsFail(message: String) {
    fetchProductsActive = false
    presenter?.fetchedDealsFail(message: message)
  }
  
}
