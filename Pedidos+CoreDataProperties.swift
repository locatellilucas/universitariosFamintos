//
//  Pedidos+CoreDataProperties.swift
//  universitariosFamintos
//
//  Created by Student on 6/30/16.
//  Copyright © 2016 Chamer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Pedidos {

    @NSManaged var numPedido: NSNumber?
    @NSManaged var precoTotal: String?
    @NSManaged var produtos: NSSet?
    @NSManaged var restaurante: Restaurantes?
    @NSManaged var usuario: Usuarios?

}
