//
//  SettingsController.swift
//  WaterAlarm
//
//  Created by serif mete on 18.10.2023.
//

import UIKit

class SettingsController: UIViewController {

    //MARK: - MyVariable
    
    var SelectedGender: Double?
    var SelectedNumber: Double?
    let ages = (30...130).map { "\($0)" }
    @IBOutlet weak var Weight: UILabel!
    @IBOutlet weak var Height: UILabel!
    @IBOutlet weak var Index: UILabel!
    @IBOutlet weak var Info: UILabel!
    @IBOutlet weak var WeightPicker: UIPickerView!
    
    
    
    //MARK: - MyFunc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUp()
        
    }
    @IBAction func GenderButton(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            SelectedGender = 0.4
        case 1:
            SelectedGender = 0.3
        default:
            SelectedGender = 0.4
        }
    }
    
    final func label(_ label: UILabel,shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 4
        let currentString = (label.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    final func SetUp() {
        WeightPicker.delegate = self
        WeightPicker.dataSource = self
        
    }

    @IBAction func Calculate(_ sender: Any) {
        self.Index.text = String((SelectedNumber ?? 30) * (SelectedGender ?? 0.4))
    }
    
    @IBAction func SetClock(_ sender: Any) {
        ClockAlert()
    }
    
}

extension SettingsController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
   internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        101
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row + 30)"
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.SelectedNumber = Double(row) + 30
    }
    
}


extension SettingsController {
    
    //MARK: - MySetClockAlert
    
    private func ClockAlert() {
        let alert = UIAlertController(title: "Set Alarm", message: "Alarm Rings Every 2 Hours", preferredStyle: UIAlertController.Style.alert)
        
        let YesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(YesButton)
        
        let NoButton = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive, handler: nil)
        alert.addAction(NoButton)
        
        self.present(alert, animated: true, completion: nil)
    }
}
