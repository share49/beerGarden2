//
//  Puntuacion+CoreDataProperties.swift
//  beerGarden
//
//  Created by Roger Pintó Diaz on 8/1/17.
//  Copyright © 2017 Roger Pintó Diaz. All rights reserved.
//
//

import Foundation
import CoreData


extension Puntuacion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Puntuacion> {
        return NSFetchRequest<Puntuacion>(entityName: "Puntuacion")
    }

    @NSManaged public var rating: Double
    @NSManaged public var toObjeto: Objeto?

}
