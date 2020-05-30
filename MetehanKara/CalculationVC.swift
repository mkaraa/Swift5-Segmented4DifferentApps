//
//  CalculationVC.swift
//  MetehanKara
//
//  Created by Metehan kara on 23.03.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class CalculationVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, AddInputVCDelegate {

    //variables
    var pickerViewData = ["Sphere","Cone","Cylinder"]
    var selectedId: Int? = nil
    var shapeName = "Sphere"

    
    //for calculations
    var area = 0.0
    var volume = 0.0
    
    //IBOutles
    @IBOutlet weak var shapeIV: UIImageView!
    @IBOutlet weak var shapePV: UIPickerView!

    
    //Delegate
    func inputData(data: (String, String)){
       
        let (radius, height) = data
        
        let r = radius
        let h = height
        
        //sphere
        if selectedId == 0 {
            area   = sphereArea(r: Double(r)!)
            volume = sphereVolume(r: Double(r)!)
        }
        //cone
        else if selectedId == 1 {
            area   = coneArea(r: Double(r)!, h: Double(h)!)
            volume = coneVolume(r: Double(r)!, h: Double(h)!)
        }
        //cylinder
        else {
            area   = cylinderArea(r: Double(r)!, h: Double(h)!)
            volume = cylinderVolume(r: Double(r)!, h: Double(h)!)
        }
        
        alert(for: "\(String(describing: shapeName)) Surface Area = \(area) and Volume = \(volume)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         if segue.identifier == "inputScreenSegue" {
             
            if let destinationVC = segue.destination as? UINavigationController,
                let controller = destinationVC.topViewController as? InputVC {
   
                controller.shape = selectedId
        
                controller.delegate = self
                
            }

         }
    
     }
    
    @IBAction func inputButton(_ sender: Any) {
         performSegue(withIdentifier: "inputScreenSegue", sender: self)
    }
    
    //CALCULATIONS
    func sphereArea(r:Double) -> Double {
        let area: Double!
        area = Double(4 * .pi * pow(Double(r),2))
        return round(100 * (area))/100
    }
    
    func sphereVolume(r: Double) -> Double {
        let volume: Double!
        volume = (4/3 * .pi * pow(Double(r), 3))
        return round(100 * (volume))/100
    }
    
    func coneArea(r:Double, h: Double) -> Double {
        let area: Double!
        area = (.pi * Double(r) * (Double(r) + sqrt(pow(Double(r), 2) + pow(Double(h),2) ) ) )
        return round(100 * (area))/100
    }
    
    func coneVolume(r: Double, h: Double) -> Double {
        let volume: Double!
        volume = (1/3 * .pi * pow(Double(r), 2) * Double(h))
        return round(100 * (volume))/100
    }
    
    func cylinderArea(r:Double, h: Double) -> Double {
        let area: Double!
        area = (2 * .pi * Double(r) * (Double(r) + Double(h)))
        return round(100 * (area))/100
    }
    
    func cylinderVolume(r: Double, h: Double) -> Double {
        let volume: Double!
        volume = (.pi * pow(Double(r), 2) * Double(h))
        return round(100 * (volume))/100
    }
    // end of calculations
    
    
    //numberOfComponents -> return 1
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // pickerViewData[row]
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    //numberOfRowsComponent -> return pickerViewData.count
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    //PV data
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedId = row
        
        switch row {
        case 0:
            shapeName = "Sphere"
            shapeIV.image = UIImage(named: "sphere.png")
        case 1:
            shapeName = "Cone"
            shapeIV.image = UIImage(named: "cone.png")
        case 2:
            shapeName = "Cylinder"
            shapeIV.image = UIImage(named: "cylinder.png")
        default:
            shapeName = "Sphere"
            shapeIV.image = UIImage(named: "sphere.png")
        }
    }
    
    //alert
    func alert(for msg: String) {
           
           let mAlert = UIAlertController(title: "Result", message: msg, preferredStyle: .alert)
           mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
           present(mAlert, animated: true, completion: nil)
           
       }
    
    //unwind
    @IBAction func goBackToCalculation(_ sender: UIStoryboardSegue) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapePV.delegate = self
        shapePV.dataSource = self
        
        shapeIV.image = UIImage(named: "sphere.png")
        selectedId = 0
        shapeName = "Sphere"
    }
}
