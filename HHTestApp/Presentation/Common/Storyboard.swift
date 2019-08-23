import UIKit

enum Storyboard {
  static let root = UIStoryboard(name: "Root", bundle: nil)
  static let authorization = UIStoryboard(name: "Authorization", bundle: nil)
}

extension UIStoryboard {
  func instantiate<T: UIViewController>() -> T {
    let viewController = instantiateViewController(withIdentifier: String(describing: T.self))
    
    guard let typedViewController = viewController as? T else { fatalError("Cannot instantiate viewController") }
    
    return typedViewController
  }
}
