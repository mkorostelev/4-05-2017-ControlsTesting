//
//  ViewController.swift
//  04_05_2017_ControlsTesting
//
//  Created by Maksym Korostelov on 5/4/17.
//  Copyright © 2017 Maksym Korostelov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeSwitchValues()
        
        changeSliderValue()
        
        changeStepperValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 1
    
    @IBOutlet weak var labelUpDown: UILabel!

    @IBAction func myFirstButtonTouchDown(_ sender: UIButton) {
        updateLabelUpDownText("Down")
    }
    @IBAction func myFirstButtonTouchUpInside(_ sender: UIButton) {
        updateLabelUpDownText("Up")
    }
    func updateLabelUpDownText(_ newText: String){
        labelUpDown.text = newText
    }
    
    // 2
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBAction func switchButton(_ sender: UISwitch) {
        changeSwitchValues()
    }
    
    @IBOutlet weak var switchImage: UIImageView!
    
    @IBOutlet weak var switchButtonOutlet: UISwitch!
    
    func changeSwitchValues(){
        switchImage.isHidden = !switchButtonOutlet.isOn
        
        switchLabel.text = switchButtonOutlet.isOn ? "On" : "Off"
    }
    
    // 3
    @IBOutlet weak var slideLabel: UILabel!
    
    @IBOutlet weak var slideButtonOutled: UISlider!
    
    @IBAction func sliderButton(_ sender: UISlider) {
        changeSliderValue()
    }
    
    func changeSliderValue(){
        slideLabel.text = String(slideButtonOutled.value)
    }
    
    // 4
    
    @IBOutlet weak var stepperLabel: UILabel!
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        changeStepperValue()
    }
    
    func changeStepperValue(){
        stepperLabel.text = String(stepperOutlet.value)
    }
    
//    var myStack = Queue()
}






























