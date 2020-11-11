import UIKit

class EnterTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(with placeholder: String, isSecureTextEntry: Bool) {
        self.init(frame: .zero)
        self.isSecureTextEntry = isSecureTextEntry
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    private func configure() {
        backgroundColor = .backgroundColor
        borderStyle = .none
        font = .systemFont(ofSize: 16)
        textColor = .white
        keyboardAppearance = .dark
    }
    
}
