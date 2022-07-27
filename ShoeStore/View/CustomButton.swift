

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
            super.awakeFromNib()
            layer.cornerRadius = 5.0
            clipsToBounds = true
    }

}
