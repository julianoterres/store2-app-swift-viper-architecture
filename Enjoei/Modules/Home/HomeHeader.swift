
import UIKit

class HomeHeader: UICollectionReusableView {
  
  @IBOutlet var content: UIView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  func commonInit() {
    Bundle.main.loadNibNamed("HomeHeader", owner: self, options: nil)
    addSubview(content)
    content.frame = bounds
    content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }
  
}
