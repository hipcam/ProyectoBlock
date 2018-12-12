//
//  IniciarSesionViewController.swift
//  AlamofireWithSwiftyJSON
//
//  Created by Fernanda  on 11/12/18.
//  Copyright © 2018 Kode. All rights reserved.
//

import UIKit
import Alamofire
class IniciarSesionViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usuarioTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        let username = usuarioTextField.text
        let pass = passwordTextField.text
        let parameters: Parameters = [
            "username" : username,
            "password" : pass
        ]
        Alamofire.request("https://rest-api-revata-jrevata.c9users.io:8080/api/Users/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.response?.statusCode {
          
            case (400?) :
                print("400")
                break;
            case (200?) :
                
                if let json = response.result.value {
                    print(response.response?.statusCode)
                    if response.response?.statusCode == 200 {
                        self.performSegue(withIdentifier: "listarSegue", sender: sender)
                        
                        print("JSON:\(json)")
                    }
                    
                }
                
                break;
            default:
                print("fin")
                break;
            }
        }
        
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
