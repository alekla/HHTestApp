import UIKit

class EnterButton: UIButton {
  fileprivate enum Constants {
    static let title = "Войти"
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  fileprivate func setup() {
    makeStyle(
      title: Constants.title,
      align: .center,
      font: UIFont.systemFont(ofSize: 15, weight: .medium),
      textColor: UIColor.white,
      kern: -0.24)
    backgroundColor = UIColor.Control.Button.Enter.background
    layer.cornerRadius = bounds.height / 2
  }
  
  func setText(text: String) {
    makeStyle(
      title: text,
      align: .center,
      font: UIFont.systemFont(ofSize: 15, weight: .medium),
      textColor: UIColor.white,
      kern: -0.24)
  }
  
}
