//
//  CarrinhoViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

func random() -> Int {
    return Int(Int(arc4random()) / 0xFFFFFFFF)
}

func random(min min: Int, max: Int) -> Int {
    return random() * (max - min) + min
}

class CarrinhoViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableViewCart: UITableView!
        
    var produto: Produtos = Produtos()
    var pedido: Pedidos = Pedidos()
    var precoTotal: String?
    var tempProduto: Produtos?
    
    var listaProdutos: [Produtos] = [Produtos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCart.dataSource = self
        listaProdutos.append(tempProduto!)

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
    
   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "PedidosFinalizar"{
                pedido.restaurante = self.produto.restaurante
                pedido.produtos = NSSet(array: self.listaProdutos)
                pedido.numPedido = random(min: 1, max: 1000)
                pedido.precoTotal = self.precoTotal
                
                PedidosDAO.inserir(pedido)
                
            
        }
    }
    

}
