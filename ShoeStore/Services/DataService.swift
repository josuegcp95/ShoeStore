

import Foundation
import CoreImage

class DataService {
    static let instance = DataService()
    
    private let shoes = [
        Product(imageName: "Nike1.jpeg", title: "Nike Air Max 90 (Black)", price: 125, quantity: 1),
        Product(imageName: "Nike2.jpeg", title: "Nike Air Max 90 (White)", price: 125, quantity: 1),
        Product(imageName: "Nike3.jpeg", title: "Nike Air Max 90 (White/Blue)", price: 200, quantity: 1),
        Product(imageName: "Nike4.jpeg", title: "Nike Air Max 90 (White/Red)", price: 200, quantity: 1),
        Product(imageName: "Nike5.jpeg", title: "Nike Air Max 270 (Black)", price: 250, quantity: 1),
        Product(imageName: "Nike6.jpeg", title: "Nike Air Max 270 (White)", price: 250, quantity: 1),
        Product(imageName: "Nike7.jpeg", title: "Nike Air Max 270 (Blue)", price: 325, quantity: 1),
        Product(imageName: "Nike8.jpeg", title: "Nike Air Max 270 (Red)", price: 325, quantity: 1)
    ]
    
    public var cart = [Product]()
    
    func getShoes() -> [Product] {
        return shoes
    }
    
    func getCart() -> [Product] {
        return cart
    }
    
    func addToCart(product: Product) {
        cart.insert(product, at: 0)
    }
    
    func removeFromCart (product: Product) {
        cart.remove(at: 0)
    }
    
    func removeAllFromCart () {
        cart.removeAll()
    }
}


