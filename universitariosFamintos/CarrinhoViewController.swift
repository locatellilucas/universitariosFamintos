//
//  CarrinhoViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

class Teste{
    var nome: String
    var info: String
    var qtde: String
    var preco: String

    init(nome: String, info: String, qtde: String, preco: String){
        self.nome = nome
        self.info = info
        self.qtde = qtde
        self.preco = preco
        
    }
}

class CarrinhoViewController: UIViewController, UITableViewDataSource{
    
    
    @IBOutlet weak var tableViewCart: UITableView!
    
    var testes: [Teste] = [Teste]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCart.dataSource = self
        let teste1 = Teste(nome: "Pizza", info: "Frango com catupery", qtde: "2", preco: "R$5,00")
        
        self.testes.append(teste1)
        self.testes.append(teste1)
        self.testes.append(teste1)
        self.testes.append(teste1)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.testes.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartIdentifier", forIndexPath: indexPath) as! ItensCartViewCell
        
        //indexPath.section
        //indexPath.row
        
        let teste = self.testes[indexPath.row]
        
        cell.nomePratoCarrinho.text = teste.nome
        cell.InfoPratoCarrinho.text = teste.info
        cell.qtdePratoCarrinho.text = teste.qtde
        cell.precoPratoCarrinho.text = teste.preco
        
        return cell
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
