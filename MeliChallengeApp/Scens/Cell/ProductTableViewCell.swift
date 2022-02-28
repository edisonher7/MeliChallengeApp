//
//  ProductTableViewCell.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 21/02/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let cellIdent = "ProductTableViewCell" // Your cell's xib file's name
    static let cellHeight: CGFloat = 100
  
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var ProductImg: UIImageView!
    
    func setProduct(_ product: ProductItem) {
        Name.text = product.name
        Price.text = product.installments.amount?.description
        condition.text = product.condition
        let url = URL(string: product.urlImage)
        let data = try? Data(contentsOf: url!)
        ProductImg.image = UIImage(data: data!)
    }
    
    
}

