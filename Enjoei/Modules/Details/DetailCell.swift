
import UIKit

class DetailCell: UICollectionViewCell {
  
  @IBOutlet weak var image: UIImageView!
  
  static let width = CGFloat(UIScreen.main.bounds.width)
  static let height = CGFloat(445)
  static let reusubleIdentifier = "DetailCell"
  
  func setup() {
    
  }
  
}
