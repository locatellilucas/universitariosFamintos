//
//  RestaurantesTableViewController.swift
//  universitariosFamintos
//
//  Created by Jones Baglioli on 6/29/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

class RestaurantesTableViewController: UITableViewController {
    
    @IBOutlet var restaurantesTableView: UITableView!
    
    var restaurante: [Restaurantes] = [Restaurantes]()
    var listaRestaurantes = RestaurantesDAO.buscarTodosRestaurantes()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantesTableView.dataSource = self
        
        /*
        let rest1: Restaurantes = Restaurantes()
        rest1.nome = "Pizzaria do Bob"
        rest1.categoria = "Pizzaria"
        rest1.descricao = "Pizzaria que existe desde 30 anos"
        rest1.local = "Bloco Azul"
         
        let rest2: Restaurantes = Restaurantes()
        rest2.nome = "Padaria do Bob"
        rest2.categoria = "Padaria"
        rest2.descricao = "Padaria que existe desde 30 anos"
        rest2.local = "Bloco Verde"
         
         
         let produto: Produtos = Produtos()
         produto.nome = "Pizza Frango com catupiry"
         produto.preco = "R$5,00"
         produto.descricao = "Frango desfiado, queijo do tipo catupiry e queijo mussarela"
         produto.imagem = "nada"
         produto.restaurante = rest1
         
         let produto2: Produtos = Produtos()
         produto2.nome = "Pizza Calabresa"
         produto2.preco = "R$5,00"
         produto2.descricao = "Calabresa fatiada e frita, queijo mussarela e azeitona"
         produto2.imagem = "nada"
         produto.restaurante = rest1
         
         let produto3: Produtos = Produtos()
         produto3.nome = "Pizza Portuguesa"
         produto3.preco = "R$5,00"
         produto3.descricao = "Presunto, queijo mussarela, ovo e oregano"
         produto3.imagem = "nada"
         produto.restaurante = rest1
         
         let produto4: Produtos = Produtos()
         produto4.nome = "Pizza Atum"
         produto4.preco = "R$5,00"
         produto4.descricao = "Atum, queijo mussarela e azeitona preta"
         produto4.imagem = "nada"
         produto.restaurante = rest1
         
        RestaurantesDAO.inserir(rest1)
        RestaurantesDAO.inserir(rest2)
         ProdutosDAO.inserir(produto)
         ProdutosDAO.inserir(produto2)
         ProdutosDAO.inserir(produto3)
         ProdutosDAO.inserir(produto4)*/
         
         
 

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of section
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listaRestaurantes.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantesIdentifier", forIndexPath: indexPath) as! RestaurantesTableViewCell
        
        let restaurante = self.listaRestaurantes[indexPath.row]
        
        //cell.restauranteImage.image = UIImage(contentsOfFile: )
        cell.restauranteNomeLabel.text = restaurante.nome
        cell.restauranteTipoLabel.text = restaurante.categoria

        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "SegueRestaurantes"{
            if let pratos = segue.destinationViewController as? PratosViewController{
                
                pratos.restaurante = self.listaRestaurantes[(restaurantesTableView.indexPathForSelectedRow?.row)!]
                
                
            }
        }
    }
    

}
