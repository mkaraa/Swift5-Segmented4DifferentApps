//
//  InputVC.swift
//  MetehanKara
//
//  Created by Metehan kara on 23.03.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit
//Delegate
protocol AddInputVCDelegate {
    func inputData(data: (String,String))
}

class InputVC: UIViewController, UITextFieldDelegate {
 
    @IBOutlet weak var radiusTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var heightLb: UILabel!
    @IBOutlet weak var navTitle: UINavigationItem!
    
    var delegate: AddInputVCDelegate?

    var radius : Int = 0
    var height : Int = 0
    var shape: Int? = nil
    
    @IBAction func DoneButton(_ sender: Any) {
        let r = radiusTF.text ?? ""
        let h = heightTF.text ?? ""
        
        if r == "" || (h == "" && !heightTF.isHidden) {
            if r == "" {
                alert(for: "Fill the radius field!")
            }
            else if h == "" && !heightTF.isHidden {
                alert(for: "Fill the height field!")
            }
        }
        else  {
            self.dismiss(animated: true, completion: nil)
            delegate?.inputData(data: (r , h ))
        }

    }
    
    //Alert
    func alert(for msg: String) {
        
        let mAlert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(mAlert, animated: true, completion: nil)
        
    }
    
    //remove keyboard when click the uiview
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
     
     }
    
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

         // allow only decimal numbers
         if textField == radiusTF {
             let decimalNums = CharacterSet(charactersIn:"0123456789")
             let set = CharacterSet(charactersIn: string)
             return decimalNums.isSuperset(of: set)
         }
         
         if textField == heightTF {
             let decimalNums = CharacterSet(charactersIn:"0123456789")
             let set = CharacterSet(charactersIn: string)
             return decimalNums.isSuperset(of: set)
         }
         
         return true
     }
    //allow only decimal
  /*  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text != "" || string != "" {
            let res = (textField.text ?? "") + string
            return Double(res) != nil
        }
        return true
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radiusTF.isUserInteractionEnabled = true
        heightTF.isUserInteractionEnabled = true
        
        radiusTF.keyboardType = .decimalPad
        heightTF.keyboardType = .decimalPad
         
        radiusTF.delegate = self
        heightTF.delegate = self
        
        radiusTF.placeholder = "Enter Radius >"
        heightTF.placeholder = "Enter Height >"
        
        if let tempShape = shape {
            if tempShape == 0 {
                heightTF.isHidden = true
                heightLb.isHidden = true
                self.navTitle.title = "Sphere"
            }
            else if tempShape == 1 {
               heightTF.isHidden = false
               heightLb.isHidden = false
               self.navTitle.title = "Cone"
            }
            else if tempShape == 2 {
               heightTF.isHidden = false
               heightLb.isHidden = false
               self.navTitle.title = "Cylinder"
            }
        }
    }
}
