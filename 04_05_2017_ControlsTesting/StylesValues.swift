//
//  StylesValues.swift
//  04_05_2017_ControlsTesting
//
//  Created by Admin on 5/9/17.
//  Copyright © 2017 Maksym Korostelov. All rights reserved.
//

import Foundation

import UIKit

struct StylesValues {
    enum FontsSizes: CGFloat {
        case small = 10
        case medium = 15
        case large = 20
    }
    
    enum BordersWidths: CGFloat {
        case thin = 1
        case medium = 2
        case thick = 2.5
    }
    
    enum BackgroungsColors{
        case lightThemeColor
        case neutralThemeColor
        case darkThemeColor
        
        var value: UIColor{
            switch self {
            case .lightThemeColor: return .lightGray
            case .darkThemeColor: return .darkGray
            case .neutralThemeColor: return .white
            }
        }
    }
    
    enum TextsColors{
        case lightThemeColor
        case neutralThemeColor
        case darkThemeColor
        
        var value: UIColor{
            switch self {
            case .lightThemeColor, .darkThemeColor: return .blue
            case .neutralThemeColor: return .black
            }
        }
    }
    
    enum ButtonsStyles{
        case circleButton(diameter: CGFloat, borderWidth: BordersWidths, fontSize: FontsSizes, backgroundColor: BackgroungsColors, textColor: TextsColors)
        case rectangleButton(height: CGFloat, width: CGFloat, borderWidth: BordersWidths, fontSize: FontsSizes, backgroundColor: BackgroungsColors, textColor: TextsColors)
        case roundedButton(height: CGFloat, width: CGFloat, borderWidth: BordersWidths, fontSize: FontsSizes, backgroundColor: BackgroungsColors, textColor: TextsColors, cornerRadius: CGFloat)
        
        var values: (height: CGFloat, wihth: CGFloat, borderWidth: CGFloat, fontSize: CGFloat, backgroundColor: UIColor, textColor: UIColor, cornerRadius: CGFloat){
            switch self {
            case let .circleButton(tuple): return (height: tuple.diameter, wihth: tuple.diameter, borderWidth: tuple.borderWidth.rawValue, fontSize: tuple.fontSize.rawValue, backgroundColor: tuple.backgroundColor.value, textColor: tuple.textColor.value, cornerRadius: CGFloat(tuple.diameter / 2))
            
            case let .rectangleButton(tuple): return (height: tuple.height, wihth: tuple.width, borderWidth: tuple.borderWidth.rawValue, fontSize: tuple.fontSize.rawValue, backgroundColor: tuple.backgroundColor.value, textColor: tuple.textColor.value, cornerRadius: CGFloat(0))
            
            case let .roundedButton(tuple): return (height: tuple.height, wihth: tuple.width, borderWidth: tuple.borderWidth.rawValue, fontSize: tuple.fontSize.rawValue, backgroundColor: tuple.backgroundColor.value, textColor: tuple.textColor.value, cornerRadius: tuple.cornerRadius)
            }
        }
    }
    
    enum ThemesColorsSets {
        case lightThemeColorsSet
        case standartThemeColorsSet
        case darkThemeColorsSet
        
        var values: (borderColor: CGColor, backgroundColor: UIColor, backgroundButtonsColor: UIColor, textColor: UIColor){
            get{
                switch self{
                case .lightThemeColorsSet:
                    return (UIColor.blue.cgColor, .lightGray, .blue, .green)
                case .standartThemeColorsSet:
                    return (UIColor.clear.cgColor, .white, .white, .black)
                case .darkThemeColorsSet:
                    return (UIColor.black.cgColor, .darkGray, .brown, .white)
                }
            }
        }
    }
    
    enum ControlsForChanging{
        case buttons([UIButton])
        case labels([UILabel])
        case buttonsAndLabels(buttons: [UIButton], labels: [UILabel])
        
        var controlsSet: ([UIButton], [UILabel]){
            switch self {
            case let .buttons(buttons): return (buttons, [UILabel]())
            case let .labels(labels): return ([UIButton](), labels)
            case let .buttonsAndLabels(buttons: buttons, labels: labels): return (buttons, labels)
            }
        }
    }
    
    struct StandartStylesItems{
        func getLightRectangleButtonStyle() -> ButtonsStyles {
            return .rectangleButton(height: 30, width: 90, borderWidth: .thin, fontSize: .small, backgroundColor: .lightThemeColor, textColor: .lightThemeColor)
        }
        
        func getNeutralCircleButtonStyle() -> ButtonsStyles {
            return .circleButton(diameter: 90, borderWidth: .thick, fontSize: .medium, backgroundColor: .neutralThemeColor, textColor: .neutralThemeColor)
        }
        
        func getDarkRoundedButtonStyle() -> ButtonsStyles {
            return .roundedButton(height: 30, width: 90, borderWidth: .thick, fontSize: .large, backgroundColor: .darkThemeColor, textColor: .darkThemeColor, cornerRadius: 20)
        }
        
        func getNeutralLabelsStyle() -> LabelsStyles {
            return LabelsStyles(textColor: .neutralThemeColor, fontSize: .small, backgroundColor: .neutralThemeColor)
        }
        
        func getLightLabelsStyle() -> LabelsStyles {
            return LabelsStyles(textColor: .lightThemeColor, fontSize: .medium, backgroundColor: .lightThemeColor)
        }
        
        func getDarkLabelsStyle() -> LabelsStyles {
            return LabelsStyles(textColor: .darkThemeColor, fontSize: .large, backgroundColor: .darkThemeColor)
        }
    }
    
    struct LabelsStyles{
        let textColor: TextsColors
        let fontSize: FontsSizes
        let backgroundColor: BackgroungsColors
    }
    
    var defaultTheme: Bool
    
    var controlsForChanging: ControlsForChanging
    
    var image:UIImage
    
    var buttonsStyle: ButtonsStyles
    
    var labelsStyle: LabelsStyles
    
    var viewBackgoundColor: BackgroungsColors
    
    let standartStylesItems = StandartStylesItems()
    
    var neutralTheme: StylesValues{
        return StylesValues(defaultTheme: true, image: #imageLiteral(resourceName: "swiftImage3"), buttonsStyle: standartStylesItems.getNeutralCircleButtonStyle(), labelsStyle: standartStylesItems.getNeutralLabelsStyle(), viewBackgoundColor: BackgroungsColors.neutralThemeColor)
    }
    
    var lightSmallTheme: StylesValues{
        return StylesValues(defaultTheme: false, image: #imageLiteral(resourceName: "swiftImage2"), buttonsStyle: standartStylesItems.getLightRectangleButtonStyle(), labelsStyle: standartStylesItems.getLightLabelsStyle(), viewBackgoundColor: BackgroungsColors.lightThemeColor)
    }
    
    var darkLargeTheme: StylesValues{
        return StylesValues(defaultTheme: false, image: #imageLiteral(resourceName: "swiftImage"), buttonsStyle: standartStylesItems.getDarkRoundedButtonStyle(), labelsStyle: standartStylesItems.getDarkLabelsStyle(), viewBackgoundColor: BackgroungsColors.darkThemeColor)
    }
    
    init() {
        self.controlsForChanging = .buttons([UIButton]())
        
        self.defaultTheme = false
        
        self.image = #imageLiteral(resourceName: "swiftImage3")
        
        let standartStylesItems = StandartStylesItems()
        
        self.buttonsStyle = standartStylesItems.getNeutralCircleButtonStyle()
        
        self.labelsStyle = standartStylesItems.getNeutralLabelsStyle()
        
        self.viewBackgoundColor = .neutralThemeColor
    }
    
    init(defaultTheme: Bool, image: UIImage, buttonsStyle: ButtonsStyles, labelsStyle: LabelsStyles, viewBackgoundColor: BackgroungsColors) {
        
        self.controlsForChanging = .buttons([UIButton]())
        
        self.defaultTheme = defaultTheme
        
        self.image = image

        self.buttonsStyle = buttonsStyle
        
        self.labelsStyle = labelsStyle
        
        self.viewBackgoundColor = viewBackgoundColor
    }
}

public extension UIButton{
    internal func setButtonFromStyle(buttonStyle: StylesValues.ButtonsStyles){
        self.layer.borderWidth = buttonStyle.values.borderWidth
        
        self.setTitleColor(buttonStyle.values.textColor, for: .normal)
        
        self.backgroundColor = buttonStyle.values.backgroundColor
        
        self.layer.cornerRadius = buttonStyle.values.cornerRadius
        
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: (buttonStyle.values.fontSize))
        
        self.frame.size = CGSize(width: buttonStyle.values.wihth, height: buttonStyle.values.height)
    }
}

public extension UILabel{
    internal func setLabelFromStyle(labelStyle: StylesValues.LabelsStyles){
        self.font = UIFont.boldSystemFont(ofSize: (labelStyle.fontSize.rawValue))
        
        self.textColor = labelStyle.textColor.value
        
        self.backgroundColor = labelStyle.backgroundColor.value
    }
}
















