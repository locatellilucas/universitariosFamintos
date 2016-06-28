//
//  UsuariosDAO.swift
//  universitariosFamintos
//
//  Created by Student on 6/28/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

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

class ContatoDAO{
    
    static func inserir(contato: Contato){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insertObject(contato)
        
        do{
            try context.save()
            print("Salvou no banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
    
    static func buscarTodosContatos() -> [Contato] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var listaContatos: [Contato] = [Contato]()
        let request: NSFetchRequest = NSFetchRequest(entityName: "Contato")
        request.sortDescriptors = [NSSortDescriptor(key:"nome", ascending: true)]
        do{
            listaContatos = try context.executeFetchRequest(request) as! [Contato]
            print("Total de contatos: ", listaContatos.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaContatos
        
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
    
    static func excluir(contato: Contato){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.deleteObject(contato)
        
        do{
            try context.save()
            print("Excluiu do banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
}