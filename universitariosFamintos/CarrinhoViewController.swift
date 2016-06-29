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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCart.dataSource = self

        
        let produto: Produtos = Produtos()
        produto.nome = "Pizza"
        produto.preco = "R$5,00"
        produto.descricao = "Frango com catupiry"
        produto.imagem = "nada"
        produto.restaurante = "Pizzaria Augusta"
        
        let produto2: Produtos = Produtos()
        produto2.nome = "Pizza"
        produto2.preco = "R$5,00"
        produto2.descricao = "Calabresa"
        produto2.imagem = "nada"
        produto2.restaurante = "Pizzaria Augusta"
      
        /*
        ProdutosDAO.inserir(produto)
        ProdutosDAO.inserir(produto2)*/
        
        
        
        
        
        
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
    }
    */

}
