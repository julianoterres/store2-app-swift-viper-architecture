
import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var pageControl: UIPageControl!
  
  var product: ProductViewEntity!
  var collectionViewScroolPoint = CGFloat(0)
  var collectionViewSlideCurrent = 0
  var totalCards = 10
  
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
    pageControl.numberOfPages = totalCards
    automaticallyAdjustsScrollViewInsets = false
    setupCollectionView()
  }
  
  func setupCollectionView() {
    collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.reusubleIdentifier)
  }
  
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return totalCards
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.reusubleIdentifier, for: indexPath) as! DetailCell
    cell.setup()
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

