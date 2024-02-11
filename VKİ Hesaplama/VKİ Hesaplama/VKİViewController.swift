//
//  VKİViewController.swift
//  VKİ Hesaplama
//
//  Created by Ozan  Doruk on 10.02.2024.
//

import UIKit

class VKI_ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var kiloTextField: UITextField!
    @IBOutlet weak var boyTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kiloTextField.delegate = self
        boyTextField.delegate = self
    }
    
    func bmiStatus(bmi: Double) -> String {
        if bmi < 18.5 {
            return "Zayıf"
        } else if bmi >= 18.5 && bmi < 24.9 {
            return "Normal Kilo"
        } else if bmi >= 24.9 && bmi < 29.9 {
            return "Kilolu"
        } else if bmi >= 30 && bmi < 34.9 {
            return "Obez"
        } else {
            return "Aşırı Obez"
        }
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        // Girilen değerlerin boş olup olmadığı kontrol edilir
        guard let kiloTextField = kiloTextField.text, let boyTextField = boyTextField.text,
              let weight = Double(kiloTextField), let height = Double(boyTextField) else {
            resultLabel.text = "Lütfen Tüm Alanları Doldurun !"
            return
            
        }
        let heightInMeters = height / 100
                
                // VKİ hesaplama
        let bmi = weight / (heightInMeters * heightInMeters)
                
                // Sonucu etikete yazdırma
        resultLabel.text = String(format: "VKİ: %.2f (%@)", bmi, bmiStatus(bmi: bmi))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
}
}

