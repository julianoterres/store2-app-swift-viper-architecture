
import Quick
import Nimble
@testable import Enjoei

class HomeViewControllerTests: QuickSpec {
  
  override func spec() {
    
    var viewController: HomeViewController!
    var presenter: HomePresenterSpy!
    var collectionView: UICollectionView!
    var loader: UIActivityIndicatorView!
    var product: ProductViewEntity!
    
    describe("HomeViewController") {
      
      beforeEach {
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
        viewController = HomeViewController()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 327, height: 1000), collectionViewLayout: UICollectionViewFlowLayout())
        loader = UIActivityIndicatorView()
        presenter = HomePresenterSpy()
        viewController.collectionView = collectionView
        viewController.loader = loader
        viewController.presenter = presenter
        viewController.products = [product]
      }
      
      describe("When viewController execute the method viewDidLoad") {
        beforeEach {
          viewController.viewDidLoad()
        }
        it("should call a method fetchProducts at presenter") {
          expect(presenter.functionCalled) == true
          expect(presenter.typeFetchPassed) == .initial
        }
      }
      
    }
    
  }
  
}
