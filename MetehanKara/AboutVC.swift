//
//  AboutVCNew.swift
//  MetehanKara
//
//  Created by Metehan kara on 19.03.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    
    @IBOutlet weak var tlabel: UILabel!
    var text: String? = nil
    var textColor: UIColor? = nil
    var textFont: UIFont? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let temp = text {
            tlabel.text! = temp
        }

        if let tempColor = textColor {
            tlabel.textColor = tempColor
        }

         if let tempFont = textFont {
            tlabel.font = tempFont
        }

        
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
