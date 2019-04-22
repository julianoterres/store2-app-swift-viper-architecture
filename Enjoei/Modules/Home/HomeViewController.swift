
import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var loader: UIActivityIndicatorView!
  
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
    collectionView.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader")
  }
  
  func setuprefreshControl() {
    do {
      guard let url = Bundle.main.url(forResource: "pull_to_refresh", withExtension: "gif", subdirectory: "Gifs") else { return }
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
    loader.stopAnimating()
    collectionView.isHidden = false
    collectionView.reloadData()
  }
  
  func showAlertError(message: String) {
    Alert.showAlert(message: message)
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: 44)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CGSize(width: 0, height: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
      return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeader", for: indexPath)  as! HomeHeader
    default:
      return UICollectionReusableView()
    }
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
