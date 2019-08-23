import UIKit

func makeCharacterSpacing(string: String, kernValue: Double = 1.15, font: UIFont, color: UIColor) -> NSMutableAttributedString {
  let attributedString = NSMutableAttributedString(string: string)
  attributedString.addAttributes(
    [
      NSAttributedString.Key.kern: kernValue,
      NSAttributedString.Key.font: font,
      NSAttributedString.Key.foregroundColor: color],
    range: NSRange(location: 0, length: attributedString.length))
  return attributedString
}
