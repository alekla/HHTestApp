import UIKit

extension UIButton {
  func makeStyle(
    title: String? = nil,
    image: UIImage? = nil,
    align: NSTextAlignment,
    font: UIFont,
    textColor: UIColor,
    kern: Double = 0) {

    titleLabel?.textAlignment = align
   
    let attr = makeCharacterSpacing(
      string: title ?? "",
      kernValue: kern,
      font: font,
      color: textColor)
    setAttributedTitle(attr, for: .normal)
    setImage(image ?? UIImage(), for: .normal)
  }
}
