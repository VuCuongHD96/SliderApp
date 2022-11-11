//
//  GradientButton.swift
//  SliderApp
//
//  Created by Sun on 11/11/2022.
//

import UIKit

public class GradientButton: UIButton {
    
    // MARK: - Define
    struct Constant {
        static let colorOne = UIColor(named: "ColorOne")
        static let colorTwo = UIColor(named: "ColorTwo")
    }
    
    // MARK: - Property
    var title = "aaaa"
    
    // MARK: - Life Cycle
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    // MARK: - View
    private func setupGradientColor() {
        let firstColor =  UIColor(red: 0/255, green: 136/255, blue: 219/255, alpha: 1.0).cgColor
         let secondColor = UIColor(red: 2/255, green: 184/255, blue: 233/255, alpha: 1.0).cgColor
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor, secondColor]
        layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupView() {
        setTitleColor(UIColor(named: "F21B3F"), for: .normal)
        setupGradientColor()
    }
}
