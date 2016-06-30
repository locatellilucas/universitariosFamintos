//
//  PratosViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

/*
class Pratos {
    var img: String
    var produto: String
    var preco: String
    var qtd: Int
    
    init(produto: String, qtd: Int, preco: String, img: String) {
        self.produto = produto
        self.qtd = qtd
        self.preco = preco
        self.img = img
    }
}
*/


class PratosViewController: UIViewController , UITableViewDataSource{

    @IBOutlet weak var tableviewPrato: UITableView!
    
    var restaurante: Restaurantes?
    
    var produto: [Produtos] = [Produtos]()
    var listaProdutos = ProdutosDAO.buscarTodosProdutos()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableviewPrato.dataSource = self

        
        let produto: Produtos = Produtos()
        produto.nome = "Pizza Frango com catupiry"
        produto.preco = "R$5,00"
        produto.descricao = "Frango desfiado, queijo do tipo catupiry e queijo mussarela"
        produto.imagem = "nada"
        produto.restaurante = restaurante
        
        let produto2: Produtos = Produtos()
        produto2.nome = "Pizza Calabresa"
        produto2.preco = "R$5,00"
        produto2.descricao = "Calabresa fatiada e frita, queijo mussarela e azeitona"
        produto2.imagem = "nada"
        produto.restaurante = restaurante
        
        let produto3: Produtos = Produtos()
        produto3.nome = "Pizza Portuguesa"
        produto3.preco = "R$5,00"
        produto3.descricao = "Presunto, queijo mussarela, ovo e oregano"
        produto3.imagem = "nada"
        produto.restaurante = restaurante
        
        let produto4: Produtos = Produtos()
        produto4.nome = "Pizza Atum"
        produto4.preco = "R$5,00"
        produto4.descricao = "Atum, queijo mussarela e azeitona preta"
        produto4.imagem = "nada"
        produto.restaurante = restaurante
 
        
        
        ProdutosDAO.inserir(produto)
        ProdutosDAO.inserir(produto2)
        ProdutosDAO.inserir(produto3)
        ProdutosDAO.inserir(produto4)
      
 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listaProdutos.count
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pratosIdentifier", forIndexPath: indexPath) as! PratosCell

        let prato = self.listaProdutos[indexPath.row]
        
        cell.plateName.text = prato.nome
        cell.qtd.text = "2"
        cell.price.text = prato.preco
        
        
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
        
        // checar identifier
        // instanciar a viewController a ser exibida
        if segue.identifier == "SegueInformacaoPrato"{
            if let informacaoPratos = segue.destinationViewController as? InformacaoPratosViewController{
                
                informacaoPratos.produto = self.listaProdutos[(tableviewPrato.indexPathForSelectedRow?.row)!]
                
                
            }
        }
        
        
    }
    

}
