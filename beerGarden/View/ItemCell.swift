//
//  ItemCell.swift
//  beerGarden
//
//  Created by Roger Pintó Diaz on 8/1/17.
//  Copyright © 2017 Roger Pintó Diaz. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var style: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var alcohol: UILabel!
    
    func configureCell(item: Objeto) {
        
        title.text = item.title?.capitalized
        price.text = "$\(item.price)"
        alcohol.text = "\(item.alcohol)°"
        thumb.image = item.toImagen?.image as? UIImage
        style.text = item.toTipo?.type
    }
}
