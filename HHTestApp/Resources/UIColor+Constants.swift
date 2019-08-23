import UIKit.UIColor

extension UIColor {
  enum Control {
    enum Button {
      enum Enter {
        static let background = UIColor(rgb: 0xff9b00)
      }
      enum Restore {
        static let blue = UIColor(rgb: 0x3885c7)
        static let border = UIColor(rgb: 0xeaeaea)
      }
      enum CreateAccount {
         static let gray = UIColor(rgb: 0x797979)
      }
    }
    enum Label {
       static let gray = UIColor(rgb: 0x797979)
    }
    enum TextField {
      static let gray = UIColor(rgb: 0x333333)
    }
    enum View {
      static let gray = UIColor(rgb: 0xebebeb)
//      static let gray2Color = UIColor(rgb: 0xd0d0d0)
      static let white = UIColor.white
    }
    enum Navigation {
      static let blue = UIColor(rgb: 0x4a90e2)
    }
  }
}
