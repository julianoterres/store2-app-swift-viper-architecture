
import UIKit

// MARK: Methods of AlertView

class AlertView: UIView {
  
  @IBOutlet var content: UIView!
  @IBOutlet weak var messageLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit() {
    Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
    self.addSubview(self.content)
    self.content.frame = self.bounds
    self.content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }
  
}


