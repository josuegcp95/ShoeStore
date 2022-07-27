

import UIKit

class PurchaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
    }
    
    @IBAction func keepBuying(_ sender: Any) {
        DataService.instance.removeAllFromCart()
    }

}
