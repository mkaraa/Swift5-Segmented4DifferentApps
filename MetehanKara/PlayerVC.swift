//
//  PlayerVC.swift
//  MetehanKara
//
//  Created by Metehan kara on 21.03.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var fbIV: UIImageView!
    @IBOutlet weak var gsIV: UIImageView!
    @IBOutlet weak var bjkIV: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerPickerView: UIPickerView!
    
    //var keysArray = Array(arrayLiteral: String())
    var players = [String]()
    var flags = [String]()
    var values = [String]()
    
    //for tableview the same team addition
    var flagfb = true
    var flaggs = true
    var flagbjk = true
    
    // PICKER VIEWS
    //write: number
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //write: numberofRows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    //write: title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
    
    // TABLE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.imageView?.image = UIImage(named: self.flags[indexPath.row])
        cell.textLabel?.text = self.players[indexPath.row]
        
        return cell
        
    }
    
    
    //Single Tap
    @IBAction func onFbSingleTap(_ sender: UITapGestureRecognizer) {
        
        populateData(team: "fenerbahce")
        
        flagfb = false
        playerPickerView.reloadAllComponents()
        tableView.reloadData()
        
    }
    
    @IBAction func onBjkSingleTap(_ sender: UITapGestureRecognizer) {
        populateData(team: "besiktas")
        flagbjk = false
        playerPickerView.reloadAllComponents()
        tableView.reloadData()
        
    }
    
    @IBAction func onGsSingleTap(_ sender: UITapGestureRecognizer) {
        
        
        populateData(team: "galatasaray")
        
        flaggs =  false
        playerPickerView.reloadAllComponents()
        tableView.reloadData()
        
    }
    
    func populateData(team: String) {
        values = [String]()
        if let path = Bundle.main.path(forResource: "players", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        if (dict.allKeys[0] as! String) == team {
                            
                            if flagfb == true && team == "fenerbahce"{
                                players.append(dict.allValues[0] as! String)
                                flags.append(team)
                                
                                
                            }
                            if flagbjk == true && team == "besiktas" {
                                players.append(dict.allValues[0] as! String)
                                flags.append(team)
                                
                            }
                            if flaggs == true && team == "galatasaray"{
                                players.append(dict.allValues[0] as! String)
                                flags.append(team)
                            }
                            values.append(dict.allValues[0] as! String)
                        }
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerPickerView.delegate = self
        playerPickerView.dataSource = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        fbIV.isUserInteractionEnabled = true
        bjkIV.isUserInteractionEnabled = true
        gsIV.isUserInteractionEnabled = true
        
        
    }
    
}

