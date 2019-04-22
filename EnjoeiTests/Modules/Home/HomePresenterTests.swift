
import Quick
import Nimble
@testable import Enjoei

class HomePresenterTests: QuickSpec {
  
  override func spec() {
    
    var presenter: HomePresenter!
    var interactor: HomeInteractorSpy!
    var viewController: HomeViewControllerSpy!
    var router: HomeRouterSpy!
    var product: ProductViewEntity!
    var products: [ProductViewEntity]!
    
    describe("HomePresenter") {
      
      beforeEach {
        presenter = HomePresenter()
        interactor = HomeInteractorSpy()
        viewController = HomeViewControllerSpy()
        router = HomeRouterSpy()
        presenter.interactor = interactor
        presenter.viewController = viewController
        presenter.router = router
        product = ProductViewEntity (
          discount: "-30%",
          imageDefault: URL(string: "http://google.com"),
          images: [URL(string: "http://google.com")],
          likes: "1",
          price: "R$ 20",
          priceFinal: "R$ 10",
          installmentText: "EM ATÉ 12X",
          title: "Title Product",
          userImage: URL(string: "http://google.com")
        )
        products = [product]
      }
      
      describe("When presenter execute the method fetchProducts") {
        
        context("and typeFetch is initial") {
          beforeEach {
            presenter.fetchProducts(typeFetch: .initial)
          }
          it("should call a method fetchProducts at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
        context("and typeFetch is pullToRefresh") {
          beforeEach {
            presenter.fetchProducts(typeFetch: .pullToRefresh)
          }
          it("should call a method fetchProducts at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
        context("and typeFetch is pagination") {
          beforeEach {
            presenter.fetchProducts(typeFetch: .pagination)
          }
          it("should call a method fetchProducts at interactor") {
            expect(interactor.functionCalled) == true
          }
        }
        
      }
      
      describe("When presenter execute the method didSelectProduct") {
        beforeEach {
          presenter.didSelectProduct(product: product)
        }
        it("should call a method goToDetails at router") {
          expect(router.functionCalled) == true
          expect(router.productPassed).toNot(beNil())
        }
      }
      
      describe("When presenter execute the method fetchedProducts") {
        
        context("and typeFetch is initial") {
          beforeEach {
            presenter.fetchedProducts(produtcts: products, typeFetch: .initial)
          }
          it("should call a method addFetchedProductsBottom at viewController") {
            expect(viewController.functionCalled) == true
            expect(viewController.contentPassed).toNot(beNil())
          }
        }
        
        context("and typeFetch is pullToRefresh") {
          beforeEach {
            presenter.fetchedProducts(produtcts: products, typeFetch: .pullToRefresh)
          }
          it("should call a method addFetchedProductsTop at viewController") {
            expect(viewController.functionCalled) == true
            expect(viewController.contentPassed).toNot(beNil())
          }
        }
        
        context("and typeFetch is pagination") {
          beforeEach {
            presenter.fetchedProducts(produtcts: products, typeFetch: .pagination)
          }
          it("should call a method addFetchedProductsBottom at viewController") {
            expect(viewController.functionCalled) == true
            expect(viewController.contentPassed).toNot(beNil())
          }
        }
        
      }
      
      describe("When presenter execute the method fetchedProductsFail") {
        beforeEach {
          presenter.fetchedProductsFail(message: "Message error")
        }
        it("should call a method showAlertError at viewController") {
          expect(viewController.functionCalled) == true
          expect(viewController.messageErrorPassed).toNot(beNil())
        }
      }
      
    }
    
  }
  
}
