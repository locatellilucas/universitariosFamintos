//
//  Restaurantes+CoreDataProperties.swift
//  universitariosFamintos
//
//  Created by Student on 6/28/16.
//  Copyright © 2016 Chamer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Restaurantes {

    @NSManaged var nome: String?
    @NSManaged var categoria: String?
    @NSManaged var descricao: String?
    @NSManaged var local: String?
    @NSManaged var imagem: String?

}
