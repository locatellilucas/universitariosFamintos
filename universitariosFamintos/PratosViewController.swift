//
//  PratosViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

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

class PratosViewController: UIViewController , UITableViewDataSource{

    @IBOutlet weak var tableviewPrato: UITableView!
    
    var pratos: [Pratos] = [Pratos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableviewPrato.dataSource = self
        
        let prato1 = Pratos(produto: "Pizza", qtd: 1, preco: "R$ 12,00", img: "pizza")
        let prato2 = Pratos(produto: "Pao de queijo", qtd: 1, preco: "R$ 3,50", img: "paoqueijo")
        let prato3 = Pratos(produto: "Crepe", qtd: 1, preco: "R$ 3,00", img: "crepe")
        
        self.pratos.append(prato1)
        self.pratos.append(prato2)
        self.pratos.append(prato3)

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
        return self.pratos.count
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pratosIdentifier", forIndexPath: indexPath) as! PratosCell

        let prato = self.pratos[indexPath.row]
        
        cell.plateImage.image = UIImage(named: prato.img)
        cell.plateName.text = prato.produto
        cell.qtd.text = String(prato.qtd)
        cell.price.text = prato.preco
        

        /*let spider = self.spiders[indexPath.row]
        
        cell.spiderImage.image = UIImage(named: spider.imageName)
        cell.name.text = spider.name
        cell.year.text = spider.year
        
        return cell
        // Configure the cell...*/

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
        
        let objeto = self.pratos[(tableviewPrato.indexPathForSelectedRow?.row)!]
        objeto
    }
    

}
