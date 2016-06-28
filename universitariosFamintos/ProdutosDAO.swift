
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

class ProdutosDAO{
    
    static func inserir(produto: Produtos){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insertObject(produto)
        
        do{
            try context.save()
            print("Salvou no banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
    
    static func buscarTodosProdutos() -> [Produtos] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var listaProdutos: [Produtos] = [Produtos]()
        let request: NSFetchRequest = NSFetchRequest(entityName: "Produtos")
        request.sortDescriptors = [NSSortDescriptor(key:"nome", ascending: true)]
        do{
            listaProdutos = try context.executeFetchRequest(request) as! [Produtos]
            print("Total de produtos: ", listaProdutos.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaProdutos
        
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
    
    static func excluir(produto: Produtos){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.deleteObject(produto)
        
        do{
            try context.save()
            print("Excluiu do banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
}