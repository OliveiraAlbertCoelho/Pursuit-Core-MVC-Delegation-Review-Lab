//
//  settingsViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by albert coelho oliveira on 8/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {
    var delegate: fontDelegate?
    var model = fontModel()
    
    @IBOutlet weak var stepperOut: UIStepper!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var previewOut: UILabel!
    @IBOutlet weak var sliderOut: UISlider!
    
    @IBAction func sliderAct(_ sender: UISlider) {
        model.changeSize(size: CGFloat(sender.value))
        updateLabel()
        stepperOut.value =  Double(sender.value)
        
    }
    @IBAction func stepperOut(_ sender: UIStepper) {
        model.changeSize(size: CGFloat(sender.value))
        updateLabel()
        sliderOut.value = Float(sender.value)
        updatePreview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    private func updateLabel () {
        messageLabel.font = UIFont.systemFont(ofSize: model.getCurrent())
        delegate?.sizeUpdate(size: model.getCurrent())
        updatePreview()
    }
    private func updatePreview (){
        previewOut.text = "Preview Font Size: \(model.getCurrent().description)"
    }
}
