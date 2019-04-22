
import Quick
import Nimble
@testable import Enjoei

class HomeWorkerTests: QuickSpec {
  
  override func spec() {
    
    var worker: HomeWorker!
    var interactor: HomeInteractorSpy!
    var api: APISpy!

    describe("HomeWorker") {
      
      beforeEach {
        worker = HomeWorker()
        interactor = HomeInteractorSpy()
        api = APISpy()
        worker.interactor = interactor
        worker.api = api
      }
      
      describe("When worker execute the method fetchProducts") {
        
        context("and request is initial and return success") {
          beforeEach {
            worker.network = NetworkProductPhotosApiEntitySuccessSpy()
            worker.fetchProducts(url: api.urlInitial, typeFetch: .initial)
          }
          it("should call a method fetchedProducts at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.responsePassed).toNot(beNil())
            expect(interactor.typeFetchPassed).toNot(beNil())
          }
        }
        
        context("and request is pullToRefresh and return success") {
          beforeEach {
            worker.network = NetworkProductPhotosApiEntitySuccessSpy()
            worker.fetchProducts(url: api.urlInitial, typeFetch: .pullToRefresh)
          }
          it("should call a method fetchedProducts at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.responsePassed).toNot(beNil())
            expect(interactor.typeFetchPassed).toNot(beNil())
          }
        }

        context("and request is pagination and return success") {
          beforeEach {
            worker.network = NetworkProductPhotosApiEntitySuccessSpy()
            worker.fetchProducts(url: api.urlInitial, typeFetch: .pagination)
          }
          it("should call a method fetchedProducts at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.responsePassed).toNot(beNil())
            expect(interactor.typeFetchPassed).toNot(beNil())
          }
          
        }
        
      }
      
      describe("When worker execute the method fetchProducts") {
        
        context("and request is initial and return fail") {
          beforeEach {
            worker.network = NetworkFailSpy()
            worker.fetchProducts(url: api.urlInitial, typeFetch: .initial)
          }
          it("should call a method fetchedProductsFail at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.messageErrorPassed).toNot(beNil())
          }
        }
        
        context("and request is pullToRefresh and return fail") {
          beforeEach {
            worker.network = NetworkFailSpy()
            worker.fetchProducts(url: api.urlInitial, typeFetch: .pullToRefresh)
          }
          it("should call a method fetchedProductsFail at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.messageErrorPassed).toNot(beNil())
          }
        }
        
        context("and request is pagination and return fail") {
          beforeEach {
            worker.network = NetworkFailSpy()
            worker.fetchProducts(url: api.urlInitial, typeFetch: .pagination)
          }
          it("should call a method fetchedProductsFail at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.messageErrorPassed).toNot(beNil())
          }
          
        }
        
      }
      
      describe("When worker execute the method fetchProductsInitial") {
        
        context("and request return success") {
          beforeEach {
            worker.network = NetworkProductPhotosApiEntitySuccessSpy()
            worker.fetchProductsInitial()
          }
          it("should call a method fetchedProducts at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.responsePassed).toNot(beNil())
            expect(interactor.typeFetchPassed).toNot(beNil())
          }
        }
        
        context("and request return fail") {
          beforeEach {
            worker.network = NetworkFailSpy()
            worker.fetchProductsInitial()
          }
          it("should call a method fetchedProductsFail at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.messageErrorPassed).toNot(beNil())
          }
        }
        
      }
      
      describe("When worker execute the method fetchProductsPullToRefresh") {
        
        context("and request return success") {
          beforeEach {
            worker.network = NetworkProductPhotosApiEntitySuccessSpy()
            worker.fetchProductsPullToRefresh()
          }
          it("should call a method fetchedProducts at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.responsePassed).toNot(beNil())
            expect(interactor.typeFetchPassed).toNot(beNil())
          }
        }
        
        context("and request return fail") {
          beforeEach {
            worker.network = NetworkFailSpy()
            worker.fetchProductsPullToRefresh()
          }
          it("should call a method fetchedProductsFail at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.messageErrorPassed).toNot(beNil())
          }
        }
        
      }
      
      describe("When worker execute the method fetchProductsPagination") {
        
        context("and request return success") {
          beforeEach {
            worker.network = NetworkProductPhotosApiEntitySuccessSpy()
            worker.fetchProductsPagination()
          }
          it("should call a method fetchedProducts at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.responsePassed).toNot(beNil())
            expect(interactor.typeFetchPassed).toNot(beNil())
          }
        }
        
        context("and request return fail") {
          beforeEach {
            worker.network = NetworkFailSpy()
            worker.fetchProductsPagination()
          }
          it("should call a method fetchedProductsFail at interactor") {
            expect(interactor.functionCalled) == true
            expect(interactor.messageErrorPassed).toNot(beNil())
          }
        }
        
      }
      
    }
    
  }
  
}
