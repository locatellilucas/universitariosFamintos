//
//  Usuarios+CoreDataProperties.swift
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

extension Usuarios {

    @NSManaged var email: String?
    @NSManaged var nome: String?
    @NSManaged var senha: String?
    @NSManaged var pedidoUsuario: Pedidos?

}
