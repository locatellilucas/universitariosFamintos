//
//  MeusPedidosViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/28/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

class MeusPedidos {
    var cod: Int
    var order: String
    var price: String
    var estabelecimento: String
    var img: String
    
    init(cod: Int, order: String, price: String, estabelecimento: String, img: String) {
        self.cod = cod
        self.order = order
        self.price = price
        self.estabelecimento = estabelecimento
        self.img = img
    }
}

class MeusPedidosViewController: UITableViewController {

    var pedidos: [MeusPedidos] = [MeusPedidos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pedido1 = MeusPedidos(cod: 3304, order: "Pizza Calabresa", price: "R$ 12,00", estabelecimento: "Pizzaria Augusta", img: "")
        let pedido2 = MeusPedidos(cod: 3333, order: "Pao de Queijo", price: "R$ 3,00", estabelecimento: "Pao de Queijaria", img: "")
        let pedido3 = MeusPedidos(cod: 2222, order: "Crepes", price: "R$ 3,50", estabelecimento: "creparia", img: "")
        
        pedidos.append(pedido1)
        pedidos.append(pedido2)
        pedidos.append(pedido3)

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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.pedidos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("meuspedidosIdentifier", forIndexPath: indexPath) as! MeusPedidosCell
        
        let pedido = self.pedidos[indexPath.row]
        
        cell.estabelecimento.text = pedido.estabelecimento
        cell.nOrder.text = String(pedido.cod)
        cell.product.text = pedido.order
        cell.price.text = pedido.price
        cell.imageOrder.image = UIImage(named: pedido.img)

        // Configure the cell...

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
