import UIKit

extension UIImageView {
    func rounded() {
        self.clipsToBounds =  true
        layer.cornerRadius = max(bounds.height, bounds.width) / 2.0
    }
}
