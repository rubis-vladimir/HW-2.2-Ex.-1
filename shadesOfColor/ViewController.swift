//
//  ViewController.swift
//  shadesOfColor
//
//  Created by Владимир Рубис on 20.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewForColorMix: BorderView!
    @IBOutlet var saturatedOfColor: [UILabel]!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet var sliders: [UISlider]!
    @IBOutlet weak var sliderAlpha: UISlider! {
        didSet {
            sliderAlpha.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForColorMix.backgroundColor = UIColor(red: 0.75, green: 0.5, blue: 0.25, alpha: 1)
    }
    
    func collectColor () {
        viewForColorMix.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: CGFloat(sliderAlpha.value))
    }

    @IBAction func rgbaSliderChanged(_ sender: UISlider) {
        collectColor()
        for index in 0..<saturatedOfColor.count {
            saturatedOfColor[index].text = String(round(Double(sliders[index].value), toDecimalPlaces: 2))
        }
    }
}

func round (_ value: Double, toDecimalPlaces places: Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return round (value * divisor) / divisor
}

@IBDesignable class BorderView : UIView {
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
        layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
