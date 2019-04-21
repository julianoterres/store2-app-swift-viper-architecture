
import UIKit
import Kingfisher

class HomeCell: UICollectionViewCell {
  
  @IBOutlet var content: UIView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var priceFinal: UILabel!
  @IBOutlet weak var likes: UILabel!
  @IBOutlet weak var userPhoto: UIImageView!
  @IBOutlet weak var photo: UIImageView!
  @IBOutlet weak var discountView: UIView!
  @IBOutlet weak var discountValue: UILabel!
  
  static let spacing = CGFloat(10)
  static let insetsPlusSpacing = CGFloat(15)
  static let collunWidth = (UIScreen.main.bounds.width/2)
  static let width = CGFloat(collunWidth - insetsPlusSpacing)
  static let height = CGFloat(collunWidth * 1.7)
  static let reusubleIdentifier = "HomeCell"
  var product: ProductViewEntity!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit() {
    Bundle.main.loadNibNamed("HomeCell", owner: self, options: nil)
    contentView.addSubview(content)
    content.frame = bounds
    content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }
  
  func setup(productView: ProductViewEntity) {
    product = productView
    setupDiscount()
    setupPrices()
    setupImages()
    setupTitle()
    setupLikes()
  }
  
  func setupDiscount() {
    guard let discount = product.discount else {
      discountView.isHidden = true
      return
    }
    discountValue.text = discount
    discountView.isHidden = false
  }
  
  func setupTitle() {
    title.text = product.title ?? ""
  }
  
  func setupPrices() {
    let priceText: NSMutableAttributedString =  NSMutableAttributedString(string: product.price ?? "")
    priceText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, priceText.length))
    price.attributedText = priceText
    priceFinal.text = product.priceFinal ?? ""
  }
  
  func setupLikes() {
    likes.text = product.likes ?? ""
  }
  
  func setupImages() {
    userPhoto.kf.setImage(with: product.userImage, placeholder: UIImage(named: "avatar_placeholder "))
    photo.kf.setImage(with: product.imageDefault, placeholder: UIImage(named: "placeholder"))
  }
  
}
