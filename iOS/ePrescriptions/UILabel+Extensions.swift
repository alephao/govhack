import UIKit

extension UILabel {
    static func body17ptBlack() -> UILabel {
        let l = UILabel()
        l.font = .systemFont(ofSize: 17)
        l.textColor = .black
        return l
    }
    
    static func subtitle15ptGray() -> UILabel {
        let l = UILabel()
        l.font = .systemFont(ofSize: 15, weight: UIFontWeightSemibold)
        l.textColor = .hex(0x999999)
        return l
    }
}
