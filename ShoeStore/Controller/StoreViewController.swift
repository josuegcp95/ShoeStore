

import UIKit

class StoreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    private(set) public var products = [Product]()

    private(set) public var shoeSelected: Product?
    private(set) public var shoeHearted: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
    }
    
    // PRODUCT INITIALIZATION
    func initProducts() {
        products = DataService.instance.getShoes()
    }
    
    // COLLECTION VIEW METHOD
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        initProducts()
        return products.count
    }
    
    // COLLECTION VIEW METHOD
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCells", for: indexPath) as? ProductCollectionViewCells {
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            return cell
        }
        return ProductCollectionViewCells()
    }
    
    // COLLECTION VIEW METHOD
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        shoeSelected = product
        performSegue(withIdentifier: "DetailViewControllerSegue", sender: product)
    }
    
    // PREPARE FOR SEGUES
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            let barBtn = UIBarButtonItem()
            barBtn.title = "Home"
            navigationItem.backBarButtonItem = barBtn
            detailViewController.product = shoeSelected
        } else if segue.destination is CheckoutViewController {
            let barBtn = UIBarButtonItem()
            barBtn.title = "Home"
            navigationItem.backBarButtonItem = barBtn
            navigationItem.backBarButtonItem?.isEnabled = false
        }
    }
    
    // DETAILVIEWCONTROLLLER UNWIND FROM SEGUE
    @IBAction func unwindFromDetailViewController(unwindSegue: UIStoryboardSegue) {
}
    
    // CHECKOUTVIEWCONTROLLLER UNWIND FROM SEGUE
    @IBAction func unwindFromCheckoutViewController(unwindSegue: UIStoryboardSegue) {
}
    
    // PURCHASEVIEWCONTROLLLER UNWIND FROM SEGUE
    @IBAction func unwindFromPurchaseViewController(unwindSegue: UIStoryboardSegue) {
}
    
    // HEART BUTTON
    @IBAction func heartTapped(_ sender: UIButton) {
       if sender.isSelected == false {
           sender.setImage(UIImage(named: "heart3.png"), for: .normal)
           sender.isSelected = true
       } else if sender.isSelected == true {
           sender.setImage(UIImage(named: "heart1.png"), for: .normal)
           sender.isSelected = false
   }
}
    
    // CART BUTTON && CHECKOUTVIEWCONTROLLER PERFORM SEGUE
    @IBAction func cartTapped(_ sender: UIButton) {
        if DataService.instance.getCart().count >= 1{
            performSegue(withIdentifier: "CheckoutViewControllerSegue", sender: self)
        } else {
            Alert.showBasicAlert(on: self, with: "Cart is empty", message: "Press OK to continue")
        }
    }
}
