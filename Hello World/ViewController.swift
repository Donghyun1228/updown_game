//
//  ViewController.swift
//  Hello World
//
//  Created by 신동현 on 2021/03/08.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    // Initial settings
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    
    // IBAction methods
    @IBAction func touchUpHitButton(_ sender:UIButton) {
        print(slider.value)
        if tryCount < 5 {
            switch Int(round(slider.value)) {
            case ..<randomValue:
                slider.minimumValue = Float(Int(round(slider.value))+1)
                minimumValueLabel.text = String(Int((slider.minimumValue)))
                slider.setValue((slider.minimumValue + slider.maximumValue) / 2, animated: true)
                sliderValueLabel.text = String(Int(round(slider.value)))
                tryCount += 1
                tryCountLabel.text = "\(tryCount) / 5"
                showAlert("업!")
                break
            case (randomValue+1)...:
                slider.maximumValue = Float(Int(round(slider.value))-1)
                maximumValueLabel.text = String(Int((slider.maximumValue)))
                slider.setValue((slider.minimumValue + slider.maximumValue) / 2, animated: true)
                sliderValueLabel.text = String(Int(round(slider.value)))
                tryCount += 1
                tryCountLabel.text = "\(tryCount) / 5"
                showAlert("다운!")
                break
            default:
                showAlert("정답입니다!")
                reset()
            }
        } else {
            if Int(round(slider.value)) == randomValue {
                showAlert("정답입니다!")
                reset()
            } else {
                showAlert("실패")
                reset()
            }
        }
    }
    
    @IBAction func touchUpResetButton(_ sender:UIButton) {
        slider.setValue(15, animated: true)
        reset()
    }
    
    @IBAction func sliderValueChanged(_ sender:UISlider) {
        sliderValueLabel.text = String(Int(round(slider.value)))
    }
    
    // Ordinary methods
    func showAlert(_ message: String) {
        let alert: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    
    func reset() {
        randomValue = Int.random(in: 1...30)
        
        slider.maximumValue = 30
        slider.minimumValue = 0
        
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        
        slider.setValue((slider.minimumValue + slider.maximumValue) / 2, animated: false)
        sliderValueLabel.text = String(Int(round(slider.value)))
        
        tryCount = 1
        tryCountLabel.text = "1 / 5"
        print(randomValue)
    }
    
}


