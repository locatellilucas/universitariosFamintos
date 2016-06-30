//
//  LoginViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/28/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    var cad: [Usuarios] = [Usuarios]()
    
    func messagebox(titulo: String, mensagem: String) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Descartar", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var senha: UITextField!
    
    @IBOutlet weak var email: UITextField!

    @IBOutlet weak var stackViewLogin: UIStackView!
    
    @IBOutlet weak var tenhoUm: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func Login(sender: AnyObject) {
        let emailtexto = email.text
        let senhatexto = senha.text
        if ((senhatexto != "") && senhatexto != ""){
            messagebox("Login realizado com sucesso!", mensagem: "logado como: \(emailtexto)")
        }
        else {
            messagebox("Tente novamente", mensagem:"Preencha corretamente os campos 'email' e 'senha'")
        }
    }
    
    @IBAction func SignUp(sender: AnyObject) {
        
        let emailtexto = email.text
        let senhatexto = senha.text
        if ((senhatexto != "") && senhatexto != ""){
            let cad1: Usuarios = Usuarios()
            cad1.email = emailtexto
            cad1.senha = senhatexto
            UsuariosDAO.inserir(cad1)
        }
        else {
            messagebox("Tente novamente", mensagem:"Preencha corretamente os campos 'email' e 'senha'")
        }
    }
    
    let facebookButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(facebookButton)
        facebookButton.frame.origin.x = 20
        facebookButton.frame.origin.y = 170
        facebookButton.frame.size.width = 375
        facebookButton.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func fetchProfile() {
        let parameters = ["fields": "first_name, last_name"]
        var nome = ""
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler({ (connection, user, requestError) -> Void in
            
            if requestError != nil {
                print(requestError)
                return
            }
            
            let firstName = user["first_name"] as? String
            let lastName = user["last_name"] as? String
            
            nome = "\(firstName!) \(lastName!)"
            
            self.messagebox("Login realizado com sucesso!", mensagem:"logado como: \(nome)")
        })
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        fetchProfile()
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        messagebox("Logoff realizado com sucesso", mensagem: "")
    }
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.stackViewLogin.transform = CGAffineTransformMakeTranslation(self.stackViewLogin.bounds.width, 0)
        loginButton.alpha = 0.0
        signupButton.alpha = 0.0
        facebookButton.alpha = 0.0
        tenhoUm.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animateWithDuration(0.5, delay: 0.7, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.stackViewLogin.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.loginButton.alpha = 1
            self.signupButton.alpha = 1
            self.facebookButton.alpha = 1
            self.tenhoUm.alpha = 1
            }, completion: nil)
        
    }
}
