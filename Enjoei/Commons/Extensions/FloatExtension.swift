
import Foundation

extension Float {
  
  var currency: String {
    return "R$ " + String(format: "%.0f", self)
  }
  
}
