//
//  VerCertificadoViewController.swift
//  AlamofireWithSwiftyJSON
//
//  Created by Fernanda  on 11/12/18.
//  Copyright © 2018 Kode. All rights reserved.
//

import UIKit
import SDWebImage

class VerCertificadoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.sd_setImage(with: URL(string: "http://images.ahoranoticias.cl/2017/02/06/189722_1_589873d103ba8.png"))        // Do any additional setup after loading the view.
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
