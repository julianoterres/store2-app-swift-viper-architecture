
import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var presenter: HomeViewControllerToPresenterProtocol!
  let refreshControl = GIFRefreshControl()
  var products: [ProductViewEntity] = []
  
  init() {
    super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.setTransparent()
    navigationController?.setIconBack()
    setuprefreshControl()
    setupCollectionView()
    presenter?.fetchProducts(typeFetch: .initial)
  }
  
  func setupCollectionView() {
    collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.reusubleIdentifier)
  }
  
  func setuprefreshControl() {
    do {
      guard let url = Bundle.main.url(forResource: "pull_to_refresh", withExtension: "gif") else { return }
      let data = try Data(contentsOf: url)
      refreshControl.animatedImage = GIFAnimatedImage(data: data)
      refreshControl.contentMode = .scaleAspectFill
      refreshControl.addTarget(self, action: #selector(didPullToRequestExecute), for: .valueChanged)
      collectionView.addSubview(refreshControl)
    } catch {
      print("Erro to create refreshControl")
    }
  }
  
  @objc func didPullToRequestExecute() {
    presenter?.fetchProducts(typeFetch: .pullToRefresh)
  }
  
}

extension HomeViewController: HomePresenterToViewControllerProtocol {
  
  func addFetchedProductsTop(productsView: [ProductViewEntity]) {
    products.prepend(contentsOf: productsView)
    refreshControl.endRefreshing()
    collectionView.reloadData()
  }
  
  func addFetchedProductsBottom(productsView: [ProductViewEntity]) {
    products.append(contentsOf: productsView)
    collectionView.reloadData()
  }
  
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return products.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.reusubleIdentifier, for: indexPath) as! HomeCell
    cell.setup(productView: products[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.didSelectProduct(product: products[indexPath.row])
  }
  
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: HomeCell.width, height: HomeCell.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return HomeCell.spacing
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y > (scrollView.contentSize.height - (scrollView.frame.size.height + HomeCell.height)) {
      presenter.fetchProducts(typeFetch: .pagination)
    }
  }
  
}
