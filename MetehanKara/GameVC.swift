//
//  GameVC.swift
//  MetehanKara
//
//  Created by Metehan kara on 19.03.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet var gameImgViews: [UIImageView]!
    var gameImgViewBGColor: UIColor? = nil
    var indexOfPV: Int? = nil
    
    @IBOutlet weak var iv1: UIImageView!
    @IBOutlet weak var iv2: UIImageView!
    @IBOutlet weak var iv3: UIImageView!
    @IBOutlet weak var iv4: UIImageView!
    @IBOutlet weak var iv5: UIImageView!
    @IBOutlet weak var iv6: UIImageView!
    @IBOutlet weak var iv7: UIImageView!
    @IBOutlet weak var iv8: UIImageView!
    @IBOutlet weak var iv9: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let temp = gameImgViewBGColor, let tempIndex = indexOfPV
        {
            gameImgViewBGColor = temp;
            indexOfPV = tempIndex
            
            if tempIndex % 2 == 0 {
                    iv1.backgroundColor = temp
                    iv5.backgroundColor = temp
                    iv9.backgroundColor = temp
            } else {
                
                    iv3.backgroundColor = temp
                    iv5.backgroundColor = temp
                    iv7.backgroundColor = temp
            }
            
            
            
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
