

import UIKit

class CheckoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var productTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        productTableView.dataSource = self
        productTableView.delegate = self
    }
    
    // TABLE VIEW METHOD
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCart().count
    }
    
    // TABLE VIEW METHOD
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCells") as? ProductTableViewCells {
            let product = DataService.instance.getCart()[indexPath.row]
            cell.updateViews(product: product)
            return cell
        } else {
            return ProductTableViewCells ()
        }
    }
    
    // PURCHASE BUTTON && PURCHASEVIEWCONTROLLER PERFORM SEGUE
    @IBAction func purchaseTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "PurchaseViewControllerSegue", sender: self)
        let barBtn = UIBarButtonItem()
        barBtn.title = "Home"
        navigationItem.backBarButtonItem = barBtn
        navigationItem.backBarButtonItem?.isEnabled = false
    }

}
