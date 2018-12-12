//
//  ListarCertViewController.swift
//  AlamofireWithSwiftyJSON
//

import UIKit
import Alamofire
import SwiftyJSON

class ListarCertViewController: UIViewController {

    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    var scheduleArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.jsonbin.io/b/5c10177b27794d69b3d67afc").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["General"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
               
            }
        
        Alamofire.request("https://rest-api-revata-jrevata.c9users.io:8080/api/Participantes").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar1 = JSON(responseData.result.value!)
                print(swiftyJsonVar1)
              
                if let jArray = swiftyJsonVar1.array {
                    if let westHolidayArray = jArray[0].array {
                        for person in westHolidayArray {
                            if let user = person["username"].string,
                                let pass = person["password"].string,
                                let dni = person["dni"].string {
                                let dict = ["user":user, "pass":pass, "dni": dni]
                                print(dict)
                            }
                        }
                    }
                }
       
            }
        }
    }
    }
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = arrRes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = dict["nombreEmpresa"] as? String
        print(dict["producciones"] as? String as Any)
        print(dict["nombre"] as? String as Any)
        cell.detailTextLabel?.text = dict["motivo"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
   
}
