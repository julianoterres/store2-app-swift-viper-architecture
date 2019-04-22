
import Quick
import Nimble
@testable import Enjoei

class DetailViewControllerTests: QuickSpec {
  
  override func spec() {
    
    var viewController: DetailViewController!
    var product: ProductViewEntity!
    
    var collectionView: UICollectionView!
    var pageControl: UIPageControl!
    var priceLabel: UILabel!
    var priceFinalLabel: UILabel!
    var installmentsLabel: UILabel!
    var stackViewPrices: UIStackView!
    var collectionViewTopConstraint: NSLayoutConstraint!
    
    describe("DetailViewController") {
      
      beforeEach {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 327, height: 1000), collectionViewLayout: UICollectionViewFlowLayout())
        pageControl = UIPageControl()
        priceLabel = UILabel()
        priceFinalLabel = UILabel()
        installmentsLabel = UILabel()
        stackViewPrices = UIStackView()
        collectionViewTopConstraint = NSLayoutConstraint()
        product = ProductViewEntity (
          discount: "-30%",
          imageDefault: URL(string: "http://google.com"),
          images: [URL(string: "http://google.com"), URL(string: "http://google.com")],
          likes: "1",
          price: "R$ 20",
          priceFinal: "R$ 10",
          installmentText: "EM ATÉ 12X",
          title: "Title Product",
          userImage: URL(string: "http://google.com")
        )
        viewController = DetailViewController()
        viewController.collectionView = collectionView
        viewController.pageControl = pageControl
        viewController.priceLabel = priceLabel
        viewController.priceFinalLabel = priceFinalLabel
        viewController.installmentsLabel = installmentsLabel
        viewController.stackViewPrices = stackViewPrices
        viewController.collectionViewTopConstraint = collectionViewTopConstraint
        viewController.product = product
        collectionView.delegate = viewController
        collectionView.dataSource = viewController
      }
      
      describe("When viewController execute the method viewDidLoad") {
        
        beforeEach {
          viewController.viewDidLoad()
        }
        
        context("and execute method setupPrices") {
          it("should labels has the values") {
            expect(viewController.priceLabel.text) == "R$ 20"
            expect(viewController.priceFinalLabel.text) == "R$ 10"
            expect(viewController.installmentsLabel.text) == "EM ATÉ 12X"
          }
        }
        
        context("and execute method setupPageControl") {
          it("should pagecontrol have number X dots") {
            expect(viewController.pageControl.numberOfPages) == 2
          }
        }
        
        context("and execute method setupCollectionView") {
          it("should collectionView have number X rows") {
            expect(viewController.collectionView.numberOfItems(inSection: 0)) == 2
          }
        }
        
      }
      
    }
    
  }
  
}
