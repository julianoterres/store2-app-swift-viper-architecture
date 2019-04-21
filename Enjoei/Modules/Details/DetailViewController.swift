
import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var priceFinalLabel: UILabel!
  @IBOutlet weak var installmentsLabel: UILabel!
  @IBOutlet weak var stackViewPrices: UIStackView!
  
  var product: ProductViewEntity!
  var collectionViewScroolPoint = CGFloat(0)
  var collectionViewSlideCurrent = 0
  
  init() {
    super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.setTransparent()
    navigationController?.setIconBack()
    pageControl.numberOfPages = product.images?.count ?? 0
    automaticallyAdjustsScrollViewInsets = false
    setupCollectionView()
    setupPrices()
  }
  
  func setupCollectionView() {
    collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.reusubleIdentifier)
  }
  
  func setupPrices() {
    stackViewPrices.spacing = (product.price == nil) ? 0 : 10
    let priceText: NSMutableAttributedString =  NSMutableAttributedString(string: product.price ?? "")
    priceText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, priceText.length))
    priceLabel.attributedText = priceText
    priceFinalLabel.text = product.priceFinal ?? ""
    installmentsLabel.text = product.installmentText ?? ""
  }
  
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return product.images?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.reusubleIdentifier, for: indexPath) as! DetailCell
    cell.setup(imageUrl: product.images?[indexPath.row] ?? nil)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    pageControl.currentPage = indexPath.row
  }
  
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: DetailCell.width, height: DetailCell.height)
  }
  
}

