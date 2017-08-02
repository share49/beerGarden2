//
//  Tipo+CoreDataProperties.swift
//  beerGarden
//
//  Created by Roger Pintó Diaz on 8/1/17.
//  Copyright © 2017 Roger Pintó Diaz. All rights reserved.
//
//

import Foundation
import CoreData


extension Tipo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tipo> {
        return NSFetchRequest<Tipo>(entityName: "Tipo")
    }

    @NSManaged public var type: String?
    @NSManaged public var toObjeto: Objeto?

}
