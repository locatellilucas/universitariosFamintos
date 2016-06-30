//
//  InformacaoPratosViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/28/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

class InformacaoPratosViewController: UIViewController {

    @IBOutlet weak var imagemPratoMeusPratos: UIImageView!
    @IBOutlet weak var descricaoPratoMeusPratos: UILabel!
    @IBOutlet weak var comentariosMeusPratos: UITextField!
    @IBOutlet weak var precoUnitarioMeusPratos:UILabel!
    @IBOutlet weak var valorQuantidadeMeusPratos: UILabel!
    @IBOutlet weak var precoTotalMeusPratos: UILabel!
    
    @IBOutlet weak var qtde: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        qtde.text = Int(sender.value).description
    }
    
    
    
    var produto: Produtos?
    
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.descricaoPratoMeusPratos.text = produto?.nome
        self.precoUnitarioMeusPratos.text = produto?.preco
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 1000
        
       // let precoUnit = Double(self.precoUnitarioMeusPratos.text!)
        //let qtde = Double(self.valorQuantidadeMeusPratos.text!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
     if segue.identifier == "SegueADDCarrinho"{
        if let addCarrinho = segue.destinationViewController as? CarrinhoViewController{
     
            addCarrinho.listaProdutos.append(self.produto!)
     
     
        }
     }

    }
 

}
