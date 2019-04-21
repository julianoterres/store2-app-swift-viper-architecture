
import UIKit
import Kingfisher

class DetailCell: UICollectionViewCell {
  
  @IBOutlet var content: UIView!
  @IBOutlet weak var image: UIImageView!
  
  static let width = CGFloat(UIScreen.main.bounds.width)
  static let height = CGFloat(445)
  static let reusubleIdentifier = "DetailCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit() {
    Bundle.main.loadNibNamed("DetailCell", owner: self, options: nil)
    contentView.addSubview(content)
    content.frame = bounds
    content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }
  
  func setup(imageUrl: URL?) {
    guard let url = imageUrl  else { return }
    image.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
  }
  
}


