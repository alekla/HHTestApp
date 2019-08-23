import UIKit

extension UILabel {
  func makeStyle(title: String?, align: NSTextAlignment, font: UIFont, color: UIColor? = .black, kern: Double = 0) {
    let attr = makeCharacterSpacing(
      string: title ?? "",
      kernValue: kern,
      font: font,
      color: textColor)
    self.attributedText = attr
    self.textColor = color
    self.numberOfLines = 0
    self.lineBreakMode = .byWordWrapping
    self.textAlignment = align
  }
}
