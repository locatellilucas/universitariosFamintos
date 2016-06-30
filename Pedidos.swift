//
//  Pedidos.swift
//  universitariosFamintos
//
//  Created by Student on 6/30/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Pedidos: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let entityDescription: NSEntityDescription = NSEntityDescription.entityForName("Pedidos", inManagedObjectContext: context)!
        
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }
}
