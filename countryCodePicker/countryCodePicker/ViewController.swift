//
//  ViewController.swift
//  countryCodePicker
//
//  Created by chaitanya on 12/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Empty String
    var countryCodes = [[String]]()
    
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var validateBtn: UIButton!
    @IBOutlet weak var textfieldView: UIView!
    @IBOutlet weak var countryCodeTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data Assigning
        self.countryCodes = getAllCountryCodes()
        // picker view function calling
         picker()
        
        countryCodeTxtField.isUserInteractionEnabled = true
        textfieldView.layer.masksToBounds = true
        textfieldView.layer.borderWidth = 1
        textfieldView.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        textfieldView.layer.cornerRadius = 15
        
        mainview.layer.masksToBounds = true
        mainview.layer.cornerRadius = 15
        
        validateBtn.layer.masksToBounds = true
        validateBtn.layer.cornerRadius = 15
        
    }
    
    func getAllCountryCodes() -> [[String]] {
        var countrys = [[String]]()
        let countryList = GlobalConstants.Constants.codePrefixes
        for item in countryList {
            countrys.append(item.value)
        }
        let sorted = countrys.sorted(by: {$0[0] < $1[0]})
        return sorted
    }
    
    // MARK: - Create UIPickerView
    
    func picker(){
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        countryCodeTxtField.inputView = picker
        picker.selectRow(0, inComponent: 0, animated: true)
    }
    
    

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - UIPickerView Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let code = countryCodes[row]
        return "\(code[0]) +\(code[1])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let code = countryCodes[row]
        countryCodeTxtField.text = "+\(code[1])"
    }
}

