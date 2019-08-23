import UIKit

protocol Presentable: AnyObject {
  var toPresent: UIViewController {get}
}

extension Presentable where Self: UIViewController {
  var toPresent: UIViewController {
    return self
  }
}

