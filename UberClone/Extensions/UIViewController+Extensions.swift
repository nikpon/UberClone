import UIKit

extension UIViewController {
    
    func presentAlertController(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func shouldPresentLoadingView(_ present: Bool, message: String? = nil) {
        if present {
            let loadingView = UIView()
            loadingView.frame = self.view.frame
            loadingView.backgroundColor = .black
            loadingView.alpha = 0
            loadingView.tag = 1

            let indicator = UIActivityIndicatorView()
            indicator.style = .large
            indicator.color = .white
            indicator.center = view.center

            let label = UILabel()
            label.text = message
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = .white
            label.textAlignment = .center
            label.alpha = 0.87

            view.addSubview(loadingView)
            loadingView.addSubview(indicator)
            loadingView.addSubview(label)

            label.centerX(inView: view)
            label.anchor(top: indicator.bottomAnchor, paddingTop: 32)

            indicator.startAnimating()

            UIView.animate(withDuration: 0.3) {
                loadingView.alpha = 0.7
            }
        } else {
            view.subviews.forEach { (subview) in
                if subview.tag == 1 {
                    UIView.animate(withDuration: 0.3, animations: {
                        subview.alpha = 0
                    }, completion: { _ in
                        subview.removeFromSuperview()
                    })
                }
            }
        }
    }
    
}
