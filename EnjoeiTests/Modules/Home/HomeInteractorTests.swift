
import Quick
import Nimble
@testable import Enjoei

class HomeInteractorTests: QuickSpec {
  
  override func spec() {
    
    var interactor: HomeInteractor!
    var presenter: HomePresenterSpy!
    var worker: HomeWorkerSpy!
    var productResponse: ProductsResponseApiEntity!
    
    describe("HomeInteractor") {
      
      beforeEach {
        interactor = HomeInteractor()
        presenter = HomePresenterSpy()
        worker = HomeWorkerSpy()
        interactor.presenter = presenter
        interactor.worker = worker
      }
      
      describe("When interactor execute the method fetchProducts") {
        
        context("and typeFetch is initial") {
          beforeEach {
            interactor.fetchProducts(typeFetch: .initial)
          }
          it("should call a method fetchProductsInitial at worker") {
            expect(worker.functionCalled) == true
          }
        }
        
        context("and typeFetch is pullToRefresh") {
          beforeEach {
            interactor.fetchProducts(typeFetch: .pullToRefresh)
          }
          it("should call a method fetchProductsPullToRefresh at worker") {
            expect(worker.functionCalled) == true
          }
        }
        
        context("and typeFetch is pagination") {
          beforeEach {
            interactor.fetchProducts(typeFetch: .pagination)
          }
          it("should call a method fetchProductsPagination at worker") {
            expect(worker.functionCalled) == true
          }
        }
        
      }
      
      describe("When interactor execute the method fetchedProducts") {
        
        beforeEach {
          do {
            let path = Bundle.main.path(forResource: "ProductsRequestSpy", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            productResponse = try JSONDecoder().decode(ProductsResponseApiEntity.self, from: data)
          } catch {
            fail("Failed load ProductsRequestSpy")
          }
        }
        
        context("and typeFetch is initial") {
          beforeEach {
            interactor.fetchedProducts(response: productResponse, typeFetch: .initial)
          }
          it("should call a method fetchedProducts at presenter") {
            expect(presenter.functionCalled) == true
            expect(presenter.typeFetchPassed).toNot(beNil())
            expect(presenter.contentPassedViewController).toNot(beNil())
            expect(presenter.contentPassedViewController?.count) == 16
          }
        }
        
        context("and typeFetch is pullToRefresh") {
          beforeEach {
            interactor.fetchedProducts(response: productResponse, typeFetch: .pullToRefresh)
          }
          it("should call a method fetchedProducts at presenter") {
            expect(presenter.functionCalled) == true
            expect(presenter.typeFetchPassed).toNot(beNil())
            expect(presenter.contentPassedViewController).toNot(beNil())
            expect(presenter.contentPassedViewController?.count) == 16
          }
        }
        
        context("and typeFetch is pagination") {
          beforeEach {
            interactor.fetchedProducts(response: productResponse, typeFetch: .pagination)
          }
          it("should call a method fetchedProducts at presenter") {
            expect(presenter.functionCalled) == true
            expect(presenter.typeFetchPassed).toNot(beNil())
            expect(presenter.contentPassedViewController).toNot(beNil())
            expect(presenter.contentPassedViewController?.count) == 16
          }
        }
        
      }
      
      describe("When interactor execute the method fetchedProductsFail") {
        beforeEach {
          interactor.fetchedProductsFail(message: "Message error")
        }
        it("should call a method fetchedProductsFail at presenter") {
          expect(presenter.functionCalled) == true
          expect(presenter.messageErrorPassed).toNot(beNil())
        }
      }
            
    }
    
  }
  
}
