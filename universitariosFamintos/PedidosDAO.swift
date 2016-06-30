
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

class PedidosDAO{
    
    static func inserir(pedido: Pedidos){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insertObject(pedido)
        
        do{
            try context.save()
            print("Salvou no banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
    
    static func buscarTodosPedidos() -> [Pedidos] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var listaPedidos: [Pedidos] = [Pedidos]()
        let request: NSFetchRequest = NSFetchRequest(entityName: "Pedidos")
        request.sortDescriptors = [NSSortDescriptor(key:"nome", ascending: true)]
        
        do{
            listaPedidos = try context.executeFetchRequest(request) as! [Pedidos]
            print("Total de pedidos: ", listaPedidos.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaPedidos
        
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
    
    static func excluir(pedido: Pedidos){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.deleteObject(pedido)
        
        do{
            try context.save()
            print("Excluiu do banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
}