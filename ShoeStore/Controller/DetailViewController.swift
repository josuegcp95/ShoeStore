

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    public var  product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        productImage.image = UIImage(named: product.imageName)
        productTitle.text = product.title
        productPrice.text = ("$\(product.price)")
    }
    
    @IBAction func addToCart(_ sender: Any) {
        DataService.instance.addToCart(product: product)
    }
        
  }
 
