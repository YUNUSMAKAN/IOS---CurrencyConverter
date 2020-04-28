//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by MAKAN on 25.04.2020.
//  Copyright © 2020 YUNUS MAKAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    

    @IBAction func getButton(_ sender: Any) {
        //1.Adim: Url olusturma
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=b646c73d686e3c2706f29baf9b6df573")
        let session = URLSession.shared
        
        //Closure
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                
                let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                //2.Adim:Veriyi Almak
                if data != nil{
                    do{
                        let jsonResponse = try  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                        
                        //ASYNC
                        DispatchQueue.main.async {
                            
                            if let rates = jsonResponse["rates"] as? [String :Any]{
                                if let cad = rates["CAD"] as? Double {
                                                                   self.cadLabel.text = "CAD : \(cad)"
                                    
                                }
                                if let chf = rates["CHF"] as? Double {
                                                                   self.chfLabel.text = "CHF : \(chf)"
                                                                   
                                                               }
                                if let gby = rates["GBP"] as? Double {
                                                                   self.gbpLabel.text = "GBY : \(gby)"
                                                                   
                                                               }
                                if let jpy = rates["JPY"] as? Double {
                                                                   self.jpyLabel.text = "JPY : \(jpy)"
                                                                   
                                                               }
                                if let usd = rates["USD"] as? Double {
                                                                   self.usdLabel.text = "USD : \(usd)"
                                                                   
                                                               }
                                if let turkish = rates["TRY"] as? Double {
                                                                   self.tryLabel.text = "TRY : \(turkish)"
                                                                   
                                                               }
                                
                            }
                        }
                        
                    }catch {
                        print("Error")
                    }
                
                }
                
            }
        }
        task.resume()
        
        
        
        
    }
    
}

