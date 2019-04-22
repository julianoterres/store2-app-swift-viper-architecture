
import Quick
import Nimble
@testable import Enjoei

class HomeRouterTests: QuickSpec {
  
  override func spec() {
    
    var router: HomeRouter!
    var viewController: UIViewController!
    
    describe("HomeRouter") {
      
      beforeEach {
        router = HomeRouter()
      }
      
      describe("When router execute the method buildModule") {
        beforeEach {
          viewController = router.buildModule()
        }
        it("should return a viewController") {
          expect(viewController).to(beAKindOf(UIViewController.self))
        }
      }
      
    }
    
  }
  
}
