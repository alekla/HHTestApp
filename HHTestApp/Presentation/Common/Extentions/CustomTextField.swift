import UIKit

class RightViewTextField: UITextField {
  let displacement: CGFloat = 6
  override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    var textRect = super.rightViewRect(forBounds: bounds)
    textRect.origin.y -= displacement
    return textRect
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    var textRect = super.textRect(forBounds: bounds)
    textRect.size.width -= displacement
    return textRect
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    var textRect = super.editingRect(forBounds: bounds)
     textRect.size.width -= displacement
    return textRect
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds
  }
}
