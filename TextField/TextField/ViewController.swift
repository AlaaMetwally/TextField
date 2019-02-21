//
//  ViewController.swift
//  TextField
//
//  Created by Geek on 12/31/18.
//  Copyright © 2018 Geek. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizeDelegate = ColorizeTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField1.delegate = self
        self.textField2.delegate = emojiDelegate
        self.textField3.delegate = colorizeDelegate
        
        self.characterCountLabel.isHidden = true
    }
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool{
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range,with: string) as NSString
        self.characterCountLabel.isHidden = (newText.length == 0)
        self.characterCountLabel.text = String(newText.length)
        
        return true;
    }

}

