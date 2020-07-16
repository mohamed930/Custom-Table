//
//  EditDataViewController.swift
//  TestCustom
//
//  Created by Mohamed Ali on 7/16/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class EditDataViewController: UIViewController {
    
    @IBOutlet weak var TXTName:UITextField!
    @IBOutlet weak var TXTAge:UITextField!
    @IBOutlet weak var TXTSalary:UITextField!
    
    public static var singleData:GuestData?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TXTName.text = EditDataViewController.singleData?.Name
        TXTAge.text = String(EditDataViewController.singleData!.Age)
        TXTSalary.text = String(EditDataViewController.singleData!.Salary)
    }
    
    
    @IBAction func Back(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension EditDataViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
