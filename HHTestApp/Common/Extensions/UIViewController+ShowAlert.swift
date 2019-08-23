import UIKit

extension UIViewController {
  func showAlert(with title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(
      UIAlertAction(
        title: "Ok",
        style: .default,
        handler: nil))
    self.present(
      alert,
      animated: true)
  }
}
