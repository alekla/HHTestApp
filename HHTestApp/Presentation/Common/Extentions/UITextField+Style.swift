import UIKit

extension UITextField {
  func makeStyle(title: String? = nil, placeholder: String? = nil, align: NSTextAlignment, font: UIFont, color: UIColor = .black, kern: Double = 0) {
    let attr = makeCharacterSpacing(
      string: title ?? "",
      kernValue: kern,
      font: font,
      color: color)
    self.attributedText = attr
    self.placeholder = placeholder ?? ""
    self.textColor = color
    self.textAlignment = align
  }
}
