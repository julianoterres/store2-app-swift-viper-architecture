
import UIKit

class Alert {
  
  static func showAlert(message: String){
    if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
      let alertView = AlertView()
      alertView.messageLabel.text = message
      alertView.frame = CGRect(x: 0, y: 0, width: window.frame.size.width, height: 135)
      alertView.tag = 99999
      alertView.layer.opacity = 0
      window.addSubview(alertView)
      UIView.animate(withDuration: 0.5,animations: {
        alertView.layer.opacity = 1
      },completion: nil)
      DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
        hideAllert()
      })
    }
  }
  
  static private func hideAllert() {
    if let app = UIApplication.shared.delegate as? AppDelegate,
      let window = app.window,
      let view = window.viewWithTag(99999) {
      UIView.animate(withDuration: 0.5,animations: {
        view.layer.opacity =  0
      },completion: { _ in
        view.removeFromSuperview()
      })
    }
  }
  
}
