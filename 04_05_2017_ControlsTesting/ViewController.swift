//
//  ViewController.swift
//  04_05_2017_ControlsTesting
//
//  Created by Maksym Korostelov on 5/4/17.
//  Copyright © 2017 Maksym Korostelov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stylesValues: StylesValues = StylesValues()
    
    var lightSmallTheme: StylesValues?
    
    var neutralTheme: StylesValues?
    
    var darkLargeTheme: StylesValues?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeSwitchValues()
        
        changeSliderValue()
        
        changeStepperValue()
        
        lightSmallTheme = stylesValues.lightSmallTheme
        
        neutralTheme = stylesValues.neutralTheme
        
        darkLargeTheme = stylesValues.darkLargeTheme
        
        lightSmallTheme?.controlsForChanging = StylesValues.ControlsForChanging.buttons([buttonUpDownOutlet])
        
        neutralTheme?.controlsForChanging = StylesValues.ControlsForChanging.buttonsAndLabels(buttons: [buttonUpDownOutlet], labels: [labelUpDown, switchLabel, slideLabel, currentStyleNameLabel])
        
        darkLargeTheme?.controlsForChanging = StylesValues.ControlsForChanging.buttonsAndLabels(buttons: [buttonUpDownOutlet], labels: [labelUpDown, switchLabel, slideLabel, currentStyleNameLabel])
            
        themeOnChanged()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 1
    
    @IBOutlet weak var buttonUpDownOutlet: UIButton!
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
    

    
    @IBOutlet weak var currentStyleNameLabel: UILabel!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBAction func semmentedControl(_ sender: UISegmentedControl) {
        themeOnChanged()
    }
    
    func themeOnChanged(){
        let currentTheme: StylesValues?
        
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            currentTheme = lightSmallTheme
        case 1:
            currentTheme = darkLargeTheme
        default:
            currentTheme = neutralTheme
        }
        if let theme = currentTheme{
            if !theme.defaultTheme{
                // set defaults for all controls
                setTheme(neutralTheme!)
            }
            // set new theme
            setTheme(theme)
        }
    }
    
    func setTheme(_ theme: StylesValues){
        currentStyleNameLabel.text = segmentedControlOutlet.titleForSegment(at: segmentedControlOutlet.selectedSegmentIndex)
        
        let (buttons, labels) = (theme.controlsForChanging.controlsSet)
        
        let (borderColor, backgroundColor, backgroundButtonsColor, textColor) = (theme.themeColorSet.values)
        
        self.view.backgroundColor = backgroundColor
        
        switchImage.image = theme.image
        
        for button in buttons {
            button.layer.borderWidth = (theme.borderWidth.rawValue)
            button.setTitleColor(textColor, for: .normal)
            button.layer.borderColor = borderColor
            button.backgroundColor = backgroundButtonsColor
            button.layer.cornerRadius = theme.cornerRadius.rawValue
            button.layer.borderWidth = theme.borderWidth.rawValue
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: (theme.fontSize.rawValue))
            button.titleLabel?.isHighlighted = true
        }
        
        for label in labels {
            label.font = UIFont.boldSystemFont(ofSize: (theme.fontSize.rawValue))
            label.textColor = textColor
            label.backgroundColor = backgroundButtonsColor
        }
    }
}






























