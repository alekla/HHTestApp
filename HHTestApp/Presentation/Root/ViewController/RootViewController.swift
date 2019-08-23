import UIKit

protocol RootViewControllerOutput: Presentable {
  var onOpenAuth: (() -> Void)! {get set}
}

class RootViewController: UIViewController, RootViewControllerOutput {
  // MARK: - Types
  enum Constants {
    static let authTitle = "Авторизация"
  }
  // MARK: - IBOutlet
  @IBOutlet private weak var enterButton: EnterButton!
  
  // MARK: - Public Properties
  var onOpenAuth: (() -> Void)!
  
  // MARK: - RootViewController(*)
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
   // MARK: - IBAction
  @IBAction func openAuthorization(_ sender: EnterButton) {
    onOpenAuth()
  }
  
  // MARK: - Private Methods {
  private func setupView() {
    view.backgroundColor = .white
    enterButton.setText(text: Constants.authTitle)
  }
  
}
