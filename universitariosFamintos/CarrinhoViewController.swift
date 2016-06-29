//
//  CarrinhoViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit


class CarrinhoViewController: UIViewController, UITableViewDataSource{
    
    
    @IBOutlet weak var tableViewCart: UITableView!
    

    var listaProdutos = ProdutosDAO.buscarTodosProdutos()
    var produto: Produtos

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCart.dataSource = self

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
        return self.listaProdutos.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartIdentifier", forIndexPath: indexPath) as! ItensCartViewCell
        
        //indexPath.section
        //indexPath.row
        
        let produto = self.listaProdutos[indexPath.row]
        
        cell.nomePratoCarrinho.text = produto.nome
        cell.InfoPratoCarrinho.text = produto.descricao
        cell.qtdePratoCarrinho.text = "2"
        cell.precoPratoCarrinho.text = produto.preco
                
        return cell
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowMeusPedidos"{
            if let viewLogin = segue.destinationViewController as? MeusPedidosViewController{
                viewLogin.nome = "Olá, " + self.nomeTextField.text!
                viewLogin.email = "E-mail " + self.emailTextField.text! + " cadastrado com sucesso!"
                
            }
        }
    }
    */

}
