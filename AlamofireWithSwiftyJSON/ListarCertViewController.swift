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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.jsonbin.io/b/5c0edf3a8392396c07235e55").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["explosivos"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = arrRes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = dict["periodoSolicitado"] as? String
        cell.detailTextLabel?.text = dict["nombre"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

