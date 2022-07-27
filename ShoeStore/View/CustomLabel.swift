

import UIKit

class CustomLabel: UILabel {
    
    override func awakeFromNib() {
            super.awakeFromNib()
            layer.cornerRadius = 5.0
            clipsToBounds = true
    }

}
