import UIKit

class NavigationViewController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.barTintColor = UIColor.white
    navigationBar.tintColor = UIColor.Control.Navigation.blue
    navigationBar.titleTextAttributes = [
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
      NSAttributedString.Key.kern: -0.41,
      NSAttributedString.Key.foregroundColor: UIColor(red: 74, green: 74, blue: 74)
    ]
  }
  
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    viewControllers.last?.makeBackButtonEmpty()
    super.pushViewController(viewController, animated: animated)
  }
}
