//
//  VerCertificadoViewController.swift
//  AlamofireWithSwiftyJSON
//
//  Created by Fernanda  on 11/12/18.
//  Copyright © 2018 Kode. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import MaterialComponents.MaterialCards

class VerCertificadoViewController: UIViewController {


    @IBOutlet weak var cargoLabel: UILabel!
    @IBOutlet weak var representanteLabel: UILabel!
    @IBOutlet weak var provinciaLabel: UILabel!
    @IBOutlet weak var depaLabel: UILabel!
    @IBOutlet weak var motivoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var certid:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        Alamofire.request("https://rest-api-revata-jrevata.c9users.io:8080/api/Certificados/1").validate().responseObject{ (response: DataResponse<Certificado>) in
            switch response.result {
            case .success:

                    if let usuario = response.result.value {
                        // That was all... You now have a User object with data
                        print("User: \(usuario)")

                        self.cargoLabel.text = usuario.cargoRepresentante
                        self.representanteLabel.text = usuario.nombreRepresentante
                        self.provinciaLabel.text = usuario.provincia
                        self.depaLabel.text = usuario.departamento
                        self.motivoLabel.text = usuario.motivo
                        self.imageView.sd_setImage(with: URL(string: "http://images.ahoranoticias.cl/2017/02/06/189722_1_589873d103ba8.png"))

    }
    case .failure(let error):
    print("TENEMOS UN GRAN ERROR", error)
    
    }
        }
    }


}
