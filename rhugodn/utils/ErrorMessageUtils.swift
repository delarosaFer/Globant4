import UIKit

extension UIViewController {
    func showErrorAlert(_ message: String = NSLocalizedString(AlertString.errorMessage.rawValue, comment: Comment.alertMessage.rawValue)) -> UIAlertController {
        let alert = UIAlertController(title: NSLocalizedString(AlertString.errorTittle.rawValue, comment: Comment.alertError.rawValue), message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: NSLocalizedString(AlertString.okAction.rawValue, comment: Comment.okAction.rawValue), style: .default, handler: nil))

        return alert
    }
}

