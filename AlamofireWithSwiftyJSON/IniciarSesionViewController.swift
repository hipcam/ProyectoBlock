//
//  IniciarSesionViewController.swift
//  AlamofireWithSwiftyJSON
//
//  Created by Fernanda  on 11/12/18.
//  Copyright © 2018 Kode. All rights reserved.
//

import UIKit

class IniciarSesionViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBAction func iniciarSesionTapped(_ sender: Any) {
     
            self.performSegue(withIdentifier: "showTableSegue", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
