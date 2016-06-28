
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

class ProdutosPedidosDAO{
    
    static func inserir(produtosPedidos: ProdutosPedidos){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insertObject(produtosPedidos)
        
        do{
            try context.save()
            print("Salvou no banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
    
    static func buscarTodosContatos() -> [ProdutosPedidos] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var listaProdutosPedidos: [ProdutosPedidos] = [ProdutosPedidos]()
        let request: NSFetchRequest = NSFetchRequest(entityName: "ProdutosPedidos")
        request.sortDescriptors = [NSSortDescriptor(key:"nome", ascending: true)]
        do{
            listaProdutosPedidos = try context.executeFetchRequest(request) as! [ProdutosPedidos]
            print("Total de produtos pedido: ", listaProdutosPedidos.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaProdutosPedidos
        
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
    
    static func excluir(produtosPedidos: ProdutosPedidos){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.deleteObject(produtosPedidos)
        
        do{
            try context.save()
            print("Excluiu do banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
}