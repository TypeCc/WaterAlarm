//
//  ViewController.swift
//  WaterAlarm
//
//  Created by serif mete on 18.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - MyVarabile
    
    @IBOutlet weak var Bottle: UIImageView!
    
    
    
    
    
    

    //MARK: - MyFunc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func WebPuplic(_ sender: Any) {
       PuplicAlert()
    }
    
    
    @IBAction func Settings(_ sender: Any) {
        // For segue settingsview
    }
    
    @IBAction func Reset(_ sender: Any) {
        ResetAlert()
        //Bottle.image = UIImage(named: "7b0d")
    }
    
    @IBAction func Alarm(_ sender: Any) {
        BottleAlert()
        //Bottle.image = UIImage(named: "2b5d")
    }
    
    private func ChooseBottle(number: Int) {
        switch number {
        case 1:
            self.Bottle.image = UIImage(named: "6b1d")
        case 2:
            self.Bottle.image = UIImage(named: "5b2d")
        case 3:
            self.Bottle.image = UIImage(named: "4b3d")
        case 4:
            self.Bottle.image = UIImage(named: "3b4d")
        case 5:
            self.Bottle.image = UIImage(named: "2b5d")
        case 6:
            self.Bottle.image = UIImage(named: "1b6d")
        case 7:
            self.Bottle.image = UIImage(named: "0b7d")
            
        default:
            Attention()
            //self.Bottle.image = UIImage(named: "7b0d")
        }
    }


}

extension ViewController {
    
    //MARK: - UIResetAlert
   private func ResetAlert() {
        let alert = UIAlertController(title: "Reset", message: "Do you want to reset?", preferredStyle: UIAlertController.Style.alert)
        
        let YesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
            UIAlertAction in self.Bottle.image = UIImage(named: "7b0d")
        }
        alert.addAction(YesButton)
        
        let NoButton = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive, handler: nil)
        alert.addAction(NoButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - UIBottleStatusAlert
   private func BottleAlert() {
        let alert = UIAlertController(title: "How Many Liters Of Water Did You Drink?", message: "Maximum 7 Liters", preferredStyle: .alert)
        
        alert.addTextField{ textField in
            textField.placeholder = "Liters"
            textField.keyboardType = .numberPad
        }
        
        let OkButon = UIAlertAction(title: "Send", style: .default){ action in
            let textField = alert.textFields![0] as UITextField
            let defaults = UserDefaults.standard
            defaults.set(textField.text, forKey: "Number")
            let MyNumber = defaults.string(forKey: "Number")
            if let GetUser = MyNumber {
                self.ChooseBottle(number: Int(GetUser) ?? 0)
                print("Alınan Veri : \(GetUser)")
            }
        }
        alert.addAction(OkButon)
        
        let NoButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: nil)
        alert.addAction(NoButton)
        
        self.present(alert, animated: true )
    }
    
    
    //MARK: - UIAttentionAlert
   private func Attention() {
        let alert = UIAlertController(title: "Attention!!", message: "Please enter a number between 1 and 7", preferredStyle: UIAlertController.Style.alert)
        
        let OkButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(OkButton)
        
        self.present(alert, animated: true )
    }
    
    
    //MARK: - UIPuplicAlert
    private func PuplicAlert() {
         let alert = UIAlertController(title: "Attention!!", message: "Do you want to go website?", preferredStyle: UIAlertController.Style.alert)
         
         let YesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
             UIAlertAction in if let url = URL(string: "https://wateralarm.serif-mete.online") {
                 UIApplication.shared.open(url, options: [:])
             }
         }
         alert.addAction(YesButton)
         
         let NoButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: nil)
         alert.addAction(NoButton)
         
         self.present(alert, animated: true, completion: nil)
     }
    
}
