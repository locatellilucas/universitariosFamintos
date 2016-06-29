//
//  RestaurantesTableViewController.swift
//  universitariosFamintos
//
//  Created by Jones Baglioli on 6/29/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

class Restaurante {
    
    var img: String
    var nome: String
    var tipo: String
    
    init(img: String, nome: String, tipo: String) {
        
        self.img = img
        self.nome = nome
        self.tipo = tipo
        
    }
    
}

class RestaurantesTableViewController: UITableViewController {
    
    @IBOutlet var restaurantesTableView: UITableView!
    
    var restaurantes: [Restaurante] = [Restaurante]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantesTableView.dataSource = self
        
        let restaurante1 = Restaurante(img: "pizza", nome: "Pizzaria do Bob", tipo: "Pizzas e massas")
        let restaurante2 = Restaurante(img: "paoqueijo", nome: "Padaria do Bob", tipo: "Padaria")
        
        self.restaurantes.append(restaurante1)
        self.restaurantes.append(restaurante2)
        
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
        return self.restaurantes.count
    }
    
    
    
    
    


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantesIdentifier", forIndexPath: indexPath) as! RestaurantesTableViewCell
        
        let restaurante = self.restaurantes[indexPath.row]
        
        cell.restauranteImage.image = UIImage(contentsOfFile: restaurante.img)
        cell.restauranteNomeLabel.text = restaurante.nome
        cell.restauranteTipoLabel.text = restaurante.tipo

        
        
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
