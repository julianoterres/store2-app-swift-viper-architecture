
import UIKit

extension UINavigationController {
  
  func setTransparent() {
    self.navigationBar.isTranslucent = true
    self.navigationBar.backgroundColor = .clear
    self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationBar.shadowImage = UIImage()
    let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
    statusBar.backgroundColor = .clear
  }
  
  func setIconBack() {
    navigationBar.topItem?.title = ""
    navigationBar.tintColor = .red
    let image = UIImage(named: "arrow_back")
    self.navigationBar.backIndicatorImage = image
    self.navigationBar.backIndicatorTransitionMaskImage = image
  }
  
}
