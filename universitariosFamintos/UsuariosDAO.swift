
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

class UsuariosDAO{
    
    static func inserir(usuario: Usuarios){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.insertObject(usuario)
        
        do{
            try context.save()
            print("Salvou no banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
    
    static func buscarTodosContatos() -> [Usuarios] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        var listaUsuarios: [Usuarios] = [Usuarios]()
        let request: NSFetchRequest = NSFetchRequest(entityName: "Usuarios")
        request.sortDescriptors = [NSSortDescriptor(key:"nome", ascending: true)]
        do{
            listaUsuarios = try context.executeFetchRequest(request) as! [Usuarios]
            print("Total de contatos: ", listaUsuarios.count)
        }catch let erro as NSError{
            print(erro)
        }
        
        return listaUsuarios
        
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
    
    static func excluir(usuario: Usuarios){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        context.deleteObject(usuario)
        
        do{
            try context.save()
            print("Excluiu do banco!")
        }catch let erro as NSError{
            print(erro)
        }
        
    }
}