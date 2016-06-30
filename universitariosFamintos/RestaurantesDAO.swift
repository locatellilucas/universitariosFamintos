
//
//  ContatoDAO.swift
//  Dia9_testebanco
//
//  Created by Student on 6/22/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RestaurantesDAO{
    
    static func inserir(restaurante: Restaurantes){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insertObject(restaurante)
        
        do{
            try context.save()
            print("Salvou no banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
    
    static func buscarTodosRestaurantes() -> [Restaurantes] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var listaRestaurantes: [Restaurantes] = [Restaurantes]()
        let request: NSFetchRequest = NSFetchRequest(entityName: "Restaurantes")
        request.sortDescriptors = [NSSortDescriptor(key:"nome", ascending: true)]
        do{
            listaRestaurantes = try context.executeFetchRequest(request) as! [Restaurantes]
            print("Total de restaurantes: ", listaRestaurantes.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaRestaurantes
        
    }
    
    static func alterar(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        do{
            try context.save()
            print("Alterou!")
            
        }catch let erro as NSError{
            print(erro)
        }
        
        
    }
    
    static func excluir(restaurante: Restaurantes){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.deleteObject(restaurante)
        
        do{
            try context.save()
            print("Excluiu do banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
}