//
//  ViewController.swift
//  Stone REV0
//
//  Created by Saulo Cunha on 14/11/16.
//  Copyright © 2016 Mr. Robot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var flagPicker: UIPickerView!
    @IBOutlet weak var flagPickerBtn: UIButton!
    @IBOutlet weak var cvvLabel: UILabel!
    @IBOutlet weak var cvvField: UITextField!
    @IBOutlet weak var valorLabel: UILabel!
    
    @IBOutlet weak var valorField: UITextField!
    let flags = ["MasterCard","Visa", "American Express"]
    
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
extension ViewController {
    func uploadImage(image: UIImage, progress: (_ percent: Float) -> Void,
                     completion: (_ tags: [String], _ colors: [PhotoColor]) -> Void) {
        guard let imageData = UIImageJPEGRepresentation(image, 0.5) else {
            print("Could not get JPEG representation of UIImage")
            return
        }
    }
}
