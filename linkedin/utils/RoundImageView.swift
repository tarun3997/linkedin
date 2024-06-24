import UIKit

class RoundImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        // Make the image view's layer fully rounded
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update the corner radius when the view's bounds change
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }
}
