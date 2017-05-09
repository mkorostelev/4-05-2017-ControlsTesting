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
    
    enum CornersRadiuses: CGFloat{
        case rectangle = 0
        case rounded = 20
        case circle = 45
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
    
    let fontSize: FontsSizes
    
    let borderWidth: BordersWidths
    
    let themeColorSet: ThemesColorsSets
    
    var defaultTheme: Bool
    
    let cornerRadius: CornersRadiuses
    
    var controlsForChanging: ControlsForChanging
    
    var image:UIImage
    
    var lightSmallTheme: StylesValues{
        return StylesValues(fontSize: .small, borderWidth: .thin, themeColorSet: .lightThemeColorsSet, defaultTheme: false, image: #imageLiteral(resourceName: "swiftImage2"), cornerRadius: .rounded)
    }
    
    var neutralTheme: StylesValues{
        return StylesValues(fontSize: .medium, borderWidth: .medium, themeColorSet: .standartThemeColorsSet, defaultTheme: true, image: #imageLiteral(resourceName: "swiftImage"), cornerRadius: .rectangle)
    }
    
    var darkLargeTheme: StylesValues{
        return StylesValues(fontSize: .large, borderWidth: .thick, themeColorSet: .darkThemeColorsSet, defaultTheme: false, image: #imageLiteral(resourceName: "swiftImage3"), cornerRadius: .circle)
    }
    
    init() {
        self.borderWidth = .thin
        self.fontSize = .small
        self.themeColorSet = .lightThemeColorsSet
        self.controlsForChanging = .buttons([UIButton]())
        self.defaultTheme = false
        self.image = #imageLiteral(resourceName: "swiftImage")
        self.cornerRadius = .rectangle
    }
    
    init(fontSize: FontsSizes, borderWidth: BordersWidths, themeColorSet: ThemesColorsSets, defaultTheme: Bool, image: UIImage, cornerRadius: CornersRadiuses) {
        self.borderWidth = borderWidth
        self.fontSize = fontSize
        self.themeColorSet = themeColorSet
        self.controlsForChanging = .buttons([UIButton]())
        self.defaultTheme = defaultTheme
        self.image = image
        self.cornerRadius = cornerRadius
    }
}




















