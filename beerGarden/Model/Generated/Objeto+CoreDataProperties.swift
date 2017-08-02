//
//  Objeto+CoreDataProperties.swift
//  beerGarden
//
//  Created by Roger Pintó Diaz on 8/1/17.
//  Copyright © 2017 Roger Pintó Diaz. All rights reserved.
//
//

import Foundation
import CoreData


extension Objeto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Objeto> {
        return NSFetchRequest<Objeto>(entityName: "Objeto")
    }

    @NSManaged public var details: String?
    @NSManaged public var title: String?
    @NSManaged public var alcohol: Double
    @NSManaged public var price: Double
    @NSManaged public var created: NSDate?
    @NSManaged public var toImagen: Imagen?
    @NSManaged public var toTipo: Tipo?
    @NSManaged public var toPuntuacion: Puntuacion?

}
