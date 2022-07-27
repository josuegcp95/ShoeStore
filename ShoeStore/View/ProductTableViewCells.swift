

import UIKit

class ProductTableViewCells: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var grandTotalLabel: UILabel!

    public var currentProduct: Product!
    public var currentProductPrice: Int = 0
    public var grandTotal: Int = 0
    public var stepValue: Int = 1
    public var stepCounter: Int = 1
        
    func updateViews(product: Product) {
        productImage.image = UIImage(named: product.imageName)
        productTitle.text = product.title
        productPrice.text = ("$\(product.price)")
        productQuantity.text = ("\(product.quantity)")
        currentProduct = product
        currentProductPrice = currentProduct.price
        calculateInitialTotal()
    }

    func calculateInitialTotal() {
        let price: [Int] = DataService.instance.cart.map({return $0 .price})
        let total: Int = price.reduce(0, +)
        grandTotal = total
        grandTotalLabel.text = ("Total: $\(grandTotal)")
    }
    
    func sumUp() {
        let price: [Int] = DataService.instance.cart.map({return $0 .price})
        let total: Int = price.reduce(0, +)
        grandTotal = total + currentProductPrice
        grandTotalLabel.text = ("Total: $\(grandTotal)")
        DataService.instance.cart.append(currentProduct)
    }
    
    func sumDown() {
        let price: [Int] = DataService.instance.cart.map({return $0 .price})
        let total: Int = price.reduce(0, +)
        grandTotal = total - currentProductPrice
        grandTotalLabel.text = ("Total: $\(grandTotal)")
        DataService.instance.cart.removeLast()
    }

    @IBAction func stepperTapped(_ sender: UIStepper){
        stepValue = Int(sender.value)
        productQuantity.text = ("\(stepValue)")

        if stepValue == stepCounter + 1 {
            sumUp()
            stepCounter += 1
        } else if stepValue == stepCounter - 1 {
            sumDown()
            stepCounter -= 1
        }
    }
}
 
