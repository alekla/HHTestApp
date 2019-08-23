import UIKit.UIViewController

extension UIViewController {
  func makeBackButtonEmpty() {
    let btn = UIBarButtonItem()
    btn.title = ""
//    btn.setTitlePositionAdjustment(UIOffset.init(horizontal: 0, vertical: 3), for: .default)
//    btn.imageInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    navigationItem.backBarButtonItem = btn
  }
}

