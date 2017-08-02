//
//  Imagen+CoreDataProperties.swift
//  beerGarden
//
//  Created by Roger Pintó Diaz on 8/1/17.
//  Copyright © 2017 Roger Pintó Diaz. All rights reserved.
//
//

import Foundation
import CoreData


extension Imagen {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Imagen> {
        return NSFetchRequest<Imagen>(entityName: "Imagen")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var toObjeto: Objeto?

}
