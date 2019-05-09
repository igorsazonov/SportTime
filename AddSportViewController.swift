//
//  ViewController.swift
//  SportTime
//
//  Created by Игорь Сазонов on 23/01/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import UIKit
import CoreData

protocol AddSportViewControllerDelegate {
    func addSportViewController(_ addSportViewController:
       AddSportViewController, didAddSport sport: SportTime )
}
/// Global variable

var pabotaMinutes:Int = 0
var pabotaSeconds:Int = 0
var otduxMinutes:Int = 0
var otduxSeconds:Int = 0
var podxoduTime:Int = 0

/////////////////////////

class AddSportViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet var naemTextField: UITextField! // Название тренировки
    
    @IBOutlet var pabotaTextField: UITextField! // работа
    
    @IBOutlet var podxoduTextField: UITextField! // количество подходов
    
    @IBOutlet var otduxTextField: UITextField! //отдых
    
    var delegate: AddSportViewControllerDelegate?
    
    var pabotaArray = [[0,1,2,3,4,5,6,7,8,9,10,
                         11,12,13,14,15,16,17,18,19,20,
                         21,22,23,24,25,26,27,28,29,30,
                         31,32,33,34,35,36,37,38,39,40,
                         41,42,43,44,45,46,47,48,49,50,
                         51,52,53,54,55,56,57,58,59],
                       [0,1,2,3,4,5,6,7,8,9,10,
                        11,12,13,14,15,16,17,18,19,20,
                        21,22,23,24,25,26,27,28,29,30,
                        31,32,33,34,35,36,37,38,39,40,
                        41,42,43,44,45,46,47,48,49,50,
                        51,52,53,54,55,56,57,58,59]]
    
    
    var otduxArray  = [[0,1,2,3,4,5,6,7,8,9,10,
                        11,12,13,14,15,16,17,18,19,20,
                        21,22,23,24,25,26,27,28,29,30,
                        31,32,33,34,35,36,37,38,39,40,
                        41,42,43,44,45,46,47,48,49,50,
                        51,52,53,54,55,56,57,58,59],
                       [0,1,2,3,4,5,6,7,8,9,10,
                        11,12,13,14,15,16,17,18,19,20,
                        21,22,23,24,25,26,27,28,29,30,
                        31,32,33,34,35,36,37,38,39,40,
                        41,42,43,44,45,46,47,48,49,50,
                        51,52,53,54,55,56,57,58,59]]
    
    
    var podxoduArray  =     [0,1,2,3,4,5,6,7,8,9,10,
                            11,12,13,14,15,16,17,18,19,20,
                            21,22,23,24,25,26,27,28,29,30,
                            31,32,33,34,35,36,37,38,39,40,
                            41,42,43,44,45,46,47,48,49,50,
                            51,52,53,54,55,56,57,58,59]
    
    
    var pabotaPicker = UIPickerView()
    
    var otduxPicker = UIPickerView()
    
    var podxoduPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       pabotaPicker.delegate = self
       pabotaPicker.dataSource = self
        
       otduxPicker.delegate = self
       otduxPicker.dataSource = self
        
       podxoduPicker.delegate = self
       podxoduPicker.dataSource = self
       
       pabotaTextField.inputView = pabotaPicker
       podxoduTextField.inputView = podxoduPicker
        
       otduxTextField.inputView = otduxPicker
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == podxoduPicker {return 1}
        if pickerView == otduxPicker {return 2}
        if pickerView == pabotaPicker {return 2}
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        if pickerView == pabotaPicker {
           return pabotaArray[component].count
        }
        
        if pickerView == podxoduPicker {
            return podxoduArray.count
        }
        
        if pickerView == otduxPicker {
            return otduxArray[component].count
        }
        return 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pabotaPicker {
            switch component {
            case 0:
                return "\(row) Мин"
            case 1:
                return "\(row) Сек"
            default:
                return ""
            }
        }
        
        if pickerView == otduxPicker {
        switch component {
        case 0:
            return "\(row) Мин"
        case 1:
            return "\(row) Сек"
        default:
            return ""
        }
          }
        
        if pickerView == podxoduPicker {
           return "\(row) "
        }
        return ""
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pabotaPicker {
             pabotaMinutes = pabotaArray[0][pickerView.selectedRow(inComponent: 0)]
            pabotaSeconds = pabotaArray[1][pickerView.selectedRow(inComponent: 1)]
                 pabotaTextField.text = convertToMinutesAndSeconds(minutes1: pabotaMinutes, seconds1: pabotaSeconds)
        }
        if pickerView == otduxPicker {
         otduxMinutes = otduxArray[0][pickerView.selectedRow(inComponent: 0)]
        otduxSeconds = otduxArray[1][pickerView.selectedRow(inComponent: 1)]
            otduxTextField.text = convertToMinutesAndSeconds(minutes1: otduxMinutes, seconds1: otduxSeconds)
        }
        if pickerView == podxoduPicker {
            podxoduTextField.text = String(podxoduArray [row])
        }
    }
  
    
    func convertToMinutesAndSeconds(minutes1:Int,seconds1:Int)-> String
    {
        var delimiter1:String = ":"
        var delimiter2:String = ""
        if (minutes1 < 10) && (seconds1 < 10) {
            delimiter1 = ":0"
            delimiter2 = "0"
            
            return delimiter2 + String(minutes1 % 60) + delimiter1 + String(seconds1 % 60)
        } else if (minutes1 < 10) && (seconds1 >= 10){
            delimiter1 = ":"
            delimiter2 = "0"
            return  delimiter2 + String(minutes1 % 60) + delimiter1 + String(seconds1 % 60)
        } else if (minutes1 >= 10) && (seconds1 < 10) {
            delimiter1 = ":0"
            return String(minutes1 % 60) + delimiter1 + String(seconds1 % 60)
        } else if (minutes1 >= 10) && (seconds1 >= 10) {
            delimiter1 = ":"
            return String(minutes1 % 60) + delimiter1 + String(seconds1 % 60)
        }
        
        return ""
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        let naem = naemTextField.text ?? ""
        let pabota = pabotaTextField.text ?? ""
        let otdux = otduxTextField.text ?? ""
        let podxodu = podxoduTextField.text ?? ""
        
        let newSportTime = SportTime(naem: naem, pabota: pabota, podxodu: podxodu,
                                     otdux: otdux, pabotaMinutes: pabotaMinutes,
                                     pabotaSeconds: pabotaSeconds, otduxMinutes: otduxMinutes,
                                     otduxSeconds: otduxSeconds, podxoduTime: podxoduTime)
        
        delegate?.addSportViewController(self, didAddSport: newSportTime)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    
}

