//
//  ViewController.swift
//  TimePicker
//
//  Created by Vishwajeet Dagar on 2/3/17.
//  Copyright © 2017 Vishwajeet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var minute: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        self.picker.selectRow(240, inComponent: 0, animated: false)
        self.picker.selectRow(600, inComponent: 1, animated: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return 24*20
        }
        else{
            return 60*20
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return "\(row % 24)"
        }
        else{
            return "\(row % 60)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            let currentRow = row % 24
            self.hour.text = "\(currentRow)"
            pickerView.selectRow(240 + currentRow, inComponent: 0, animated: false)
        }
        else{
            let currentRow = row % 60
            self.minute.text = "\(currentRow)"
            pickerView.selectRow(600 + currentRow, inComponent: 1, animated: false)
        }
    }

}

