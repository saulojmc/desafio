//
//  ViewController.swift
//  Stone REV0
//
//  Created by Saulo Cunha on 14/11/16.
//  Copyright © 2016 Mr. Robot. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    //mark: - IBOUTLET
    @IBOutlet weak var flagPicker: UIPickerView!
    @IBOutlet weak var flagPickerBtn: UIButton!
    @IBOutlet weak var cvvLabel: UILabel!
    @IBOutlet weak var cvvField: UITextField!
    @IBOutlet weak var valorLabel: UILabel!
    
    @IBOutlet weak var valorField: UITextField!
    //Contants das bandeiras
    let flags = ["MasterCard","Visa", "American Express"]
    
    //mark: - Properties
    fileprivate var tags: [strings?]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // acionando DataSource e ViewDelegate
        flagPicker.dataSource = self
        flagPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //mark: - IBACtions
    @IBAction func flagBtnPressed(_ sender: AnyObject) {
        flagPicker.isHidden = false
        cvvLabel.isHidden = true
        cvvField.isHidden = true
        valorLabel.isHidden = true
        valorField.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flags.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flags[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        flagPickerBtn.setTitle(flags[row], for: UIControlState()) //UIControlState.normal
        flagPicker.isHidden = true
        cvvLabel.isHidden = true
        cvvField.isHidden = false
        valorLabel.isHidden = false
        valorField.isHidden = false
    }
    
    
    @IBAction func buyNowBtn(_ sender: Any) {
        for i in 1...10 {
            self.view.viewWithTag(i)?.isHidden = true
        }
        
    }
}
// Networking calls

