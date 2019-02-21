//
//  EmojiTextFieldDelegate.swift
//  TextField
//
//  Created by Geek on 1/1/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate : NSObject, UITextFieldDelegate {
    var translations = [String: String]()
    override init() {
        super.init()
        translations["heart"] = "\u{0001F496}"
        translations["fish"] = "\u{E522}"
        translations["bird"] = "\u{E523}"
        translations["frog"] = "\u{E531}"
        translations["bear"] = "\u{E527}"
        translations["dog"] = "\u{E052}"
        translations["cat"] = "\u{E04F}"
    }
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool{
        var emojiStringRange: NSRange
        var replacedAnEmoji = false
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
       
        for (emojiString, emoji) in translations {
            
            repeat{
                emojiStringRange = newText.range(of: emojiString, options: .caseInsensitive)
                if emojiStringRange.location != NSNotFound {
                    newText = newText.replacingCharacters(in: emojiStringRange, with: emoji) as NSString
                    replacedAnEmoji = true
                }
            }while emojiStringRange.location != NSNotFound
        }
        if replacedAnEmoji{
            textField.text = newText as String
            return false;
        }else{
         return true;
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
