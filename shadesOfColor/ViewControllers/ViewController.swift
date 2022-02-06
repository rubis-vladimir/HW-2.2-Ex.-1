//
//  ViewController.swift
//  shadesOfColor
//
//  Created by Владимир Рубис on 20.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewColorMix: UIView!
    
    @IBOutlet var saturatedOfColor: [UILabel]!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderAlpha: UISlider!
    @IBOutlet var sliders: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    @IBAction func rgbaSliderChanged(_ sender: UISlider) {
        collectColor()
        
        for index in 0..<saturatedOfColor.count {
            saturatedOfColor[index].text = String(format: "%.2f", sliders[index].value)
        }
    }
    
    private func collectColor () {
        viewColorMix.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: CGFloat(sliderAlpha.value))
    }
    
    private func setupElements() {
        collectColor ()
        
        viewColorMix.layer.borderWidth = 3
        viewColorMix.layer.borderColor = UIColor.gray.cgColor
        viewColorMix.layer.cornerRadius = 15
        
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        sliderAlpha.minimumTrackTintColor = .cyan
    }
}


