//
//  ListarCertViewController.swift
//  AlamofireWithSwiftyJSON

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

class ListarCertViewController: UIViewController{
    
    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    var scheduleArray = [Dictionary<String,String>]()
    var certificados:[Certificado] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    public func loadData(){
        
        Alamofire.request("https://rest-api-revata-jrevata.c9users.io:8080/api/Certificados").validate().responseArray{ (response: DataResponse<[Certificado]>) in
            switch response.result {
            case .success:
                
                if let json = response.result.value {
                    
                    print("JSON: \(json)") // serialized json response
                    
                    if let certificados = response.result.value {
                        // That was all... You now have a User object with data
                        print("USUARIOS: \(certificados)")
                      
                        self.certificados = certificados
                        self.tblJSON.reloadData()
                        
                        
                    }                }
            case .failure(let error):
                print("TENEMOS UN GRAN ERROR", error)
                
            }
            
            
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
         let certificado:Certificado = self.certificados[indexPath.row]
        if(certificado.idPropietario == "1"){
            cell.textLabel?.text =  certificado.motivo
            cell.detailTextLabel?.text = certificado.departamento
        
        }
        return cell
    }
    func countCertificates()->Int{
        let certificados = self.certificados
        var count = 0
        for cert in certificados{
            if cert.idPropietario=="1"{
                count=count + 1
            }
        }
        return count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countCertificates()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let certificado:Certificado = self.certificados[indexPath.row]
        self.performSegue(withIdentifier: "showCertificadosSegue", sender: certificado.idcertificados)
        print("ESTO", certificado.idcertificados as Any)
        
    }
    
}
func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    if segue.identifier == "showCertificadosSegue" {
        if(sender != nil){
            let id = sender as! Int
            let viewController = segue.destination as! VerCertificadoViewController
            viewController.certid = id
        }else{
            print("ERROR")
          
        }
    }
}

