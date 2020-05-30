//
//  WHtR.swift
//  MetehanKara
//
//  Created by Metehan kara on 21.03.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class WHtRVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var weistTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var genderSwitchLabel: UILabel!
    @IBOutlet weak var genderSwitchLabel2: UILabel!
    @IBOutlet weak var calculatedLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var wthrLbl: UILabel!
    
    var weist = 0
    var height = 0
    var wthr = 0.0
 
    var alert = UIAlertController(title: "Alert!", message: "This field cannot be empty!", preferredStyle: .alert)

    
    @IBAction func onClick(_ sender: UIButton) {
        

        messageLabel.isHidden = false
        wthrLbl.isHidden = false
        calculatedLabel.isHidden = false
        genderSwitchLabel2.isHidden = false
        
        self.weistTF.resignFirstResponder()
        self.heightTF.resignFirstResponder()
        
        if weistTF.text == "" || heightTF.text == "" {
              alert(for: "Fields cannot be empty !")
        }
        else {
            weist = Int(weistTF.text ?? "" ) ?? 0
            height = Int(heightTF.text ?? "" ) ?? 0
            wthr = Double(weist * 100 / height )
        }
         
        calculatedLabel.text = String(wthr)

        if genderSwitch.isOn {
   
            if wthr <= 35 {
                messageLabel.text = "Abnormally Slim to Underweight"
            }
            else if wthr > 35 && wthr <= 43 {
                messageLabel.text = "Extremely Slim"
            }
            else if wthr > 43 && wthr <= 46 {
                messageLabel.text = "Slender and Healthy"
            }
            else if wthr > 46 && wthr <= 53 {
                messageLabel.text = "Healthy and Normal Weight"
            }
            else if wthr > 53 && wthr <= 58 {
                messageLabel.text = "Overweight"
            }
            else if wthr > 58 && wthr <= 63 {
                messageLabel.text = "Extremely Overweight/Obese"
            }
            else {
                messageLabel.text = "Highly Obese"
            }
        }
        else {
            if wthr <= 35 {
                messageLabel.text = "Abnormally Slim to Underweight"
            }
            else if wthr > 35 && wthr <= 42 {
                messageLabel.text = "Extremely Slim"
            }
            else if wthr > 42 && wthr <= 46 {
                messageLabel.text = "Slender and Healthy"
            }
            else if wthr > 46 && wthr <= 49 {
                messageLabel.text = "Healthy and Normal Weight"
            }
            else if wthr > 49 && wthr <= 54 {
                messageLabel.text = "Overweight"
            }
            else if wthr > 54 && wthr <= 58 {
                messageLabel.text = "Seriously Overweight"
            }
            else {
                messageLabel.text = "Highly Obese"
            }
        }
        

    }
    
    @IBAction func GenderSw(_ sender: UISwitch) {
        if genderSwitch.isOn {
                 genderSwitchLabel.text = " (male) :"
                 genderSwitchLabel2.text = " (male) :"
        } else {
                genderSwitchLabel.text = " (female) :"
                genderSwitchLabel2.text = " (female) :"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.weistTF.placeholder = "Weist"
        self.heightTF.placeholder = "Height"
        
        self.weistTF.delegate = self
        self.heightTF.delegate = self

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    func alert(for msg: String) {
           
           let mAlert = UIAlertController(title: "Result", message: msg, preferredStyle: .alert)
           mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
           present(mAlert, animated: true, completion: nil)
           
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
