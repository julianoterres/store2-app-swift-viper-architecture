
import Quick
import Nimble
@testable import Enjoei

class DetailRouterTests: QuickSpec {
  
  override func spec() {
    
    var router: DetailRouter!
    var viewController: UIViewController!
    
    describe("DetailRouter") {
      
      beforeEach {
        router = DetailRouter()
      }
      
      describe("When router execute the method buildModule") {
        beforeEach {
          let product = ProductViewEntity (
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
          viewController = router.buildModule(product: product)
        }
        it("should return a viewController") {
          expect(viewController).to(beAKindOf(UIViewController.self))
        }
      }
      
    }
    
  }
  
}
