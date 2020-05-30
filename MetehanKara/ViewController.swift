//
//  ViewController.swift
//  MetehanKara
//
//  Created by Metehan kara on 19.03.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var controlLabel: UILabel!
    @IBOutlet weak var colorPickerView: UIPickerView!
    @IBOutlet var Tap: UITapGestureRecognizer!
    @IBOutlet weak var firstLabel: UILabel!
    
    var gameColor: UIColor? = nil
    var indexOfPickerView: Int? = nil
    
    let  pickerData = ["red","green","blue","yellow","pink"]
    
    override func viewDidLoad() {
    super.viewDidLoad()
         
         //Connect Data
         self.colorPickerView.delegate = self
         self.colorPickerView.dataSource = self
        
        gameColor = UIColor.red
        indexOfPickerView = 0
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gamevc" {
            let gController = segue.destination as? GameVC
            if let gameController = gController {
                gameController.gameImgViewBGColor = gameColor;
                gameController.indexOfPV = indexOfPickerView
            }
        }
        
        if segue.identifier == "aboutvc" {
            let controller = segue.destination as? AboutVC
            if let tempController = controller {
                tempController.text = "CTIS 480: HOMEWORK I"
                tempController.textColor = UIColor.red
               tempController.textFont = UIFont.boldSystemFont(ofSize: 24.0)
            }
        }
    }
    
    //write number
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    //write title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //write didSelectedRow
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            gameColor = UIColor.red
            indexOfPickerView = 0
        case 1:
            gameColor = UIColor.green
             indexOfPickerView = 1
        case 2:
            gameColor = UIColor.blue
             indexOfPickerView = 2
        case 3:
            gameColor = UIColor.yellow
            indexOfPickerView = 3
        case 4:
            gameColor = UIColor.purple
            indexOfPickerView = 4
        default:
            gameColor = UIColor.red
        }
    }
    
    //write numberofrows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    //single tap on imageview
    @IBAction func onSingleTap(_ sender: UITapGestureRecognizer) {

        if segmentControl.selectedSegmentIndex < 4 {
                segmentControl.selectedSegmentIndex = segmentControl.selectedSegmentIndex + 1
                self.segmentedControl(segmentControl)
            
        } else {
            segmentControl.selectedSegmentIndex = 0
            self.segmentedControl(segmentControl)
        }
    }
    
    // long press on imageview
    @IBAction func onLongPressTap(_ sender: UILongPressGestureRecognizer) {
    
        if segmentControl.selectedSegmentIndex == 0 {
                       performSegue(withIdentifier: "calculationvc", sender: self)
        }
        
        if segmentControl.selectedSegmentIndex == 1 {
                       performSegue(withIdentifier: "whtrvc", sender: self)
        }
        
        if segmentControl.selectedSegmentIndex == 2 {
                  performSegue(withIdentifier: "gamevc", sender: self)
        }
        
        if segmentControl.selectedSegmentIndex == 3 {
                       performSegue(withIdentifier: "playervc", sender: self)
        }
        
        if segmentControl.selectedSegmentIndex == 4{
             performSegue(withIdentifier: "aboutvc", sender: self)
        }

    }

  
    //unwind segue
    @IBAction func goBackToFirst(_ sender: UIStoryboardSegue) {
        segmentControl.selectedSegmentIndex = 0
        segmentedControl(segmentControl)
  
     }
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
           
           switch (segmentControl.selectedSegmentIndex) {
           case 0:
               self.colorPickerView.isHidden = true
               self.controlLabel.text = "Calculation Controller"
               imageView.image = UIImage(named: "calculation.png")
           case 1:
               self.colorPickerView.isHidden = true
               self.controlLabel.text = "WHtR Controller"
               imageView.image = UIImage(named: "whtr.png")
           case 2:
               self.colorPickerView.isHidden = false
               self.controlLabel.text = "Game Controller"
               imageView.image = UIImage(named: "game.png")
           case 3:
               self.colorPickerView.isHidden = true
               self.controlLabel.text = "Player Controller"
               imageView.image = UIImage(named: "player.png")
           case 4:
               self.colorPickerView.isHidden = true
               self.controlLabel.text = "About Controller"
               imageView.image = UIImage(named: "about.png")
           default:
               self.colorPickerView.isHidden = true
               self.controlLabel.text = "Calculation Controller"
               imageView.image = UIImage(named: "calculation.png")
           }
       }
}

