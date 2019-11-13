//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var scrambledWord: UITextView!
    
    @IBOutlet weak var newWordButton: UIButton!
   
var word = Word.getRandomWord()
    
    var wordArr:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrambledWord.text = word.scrambled
        
        self.textField.delegate = self
        newWordButton.setTitleColor(UIColor.white, for: .normal)
        newWordButton.isEnabled = false
    
        // Do any additional setup after loading the view.
    }
    
    func checkUserGuess() {
    let userInput = textField.text ?? ""
        wordArr.append(userInput)
        
    print(wordArr)
        
        
    }
    
    
    
    

    
    @IBAction func checkForCorrectWord(_ sender: UIButton) {
        
        newWordButton.isEnabled = false
        
        // to be called when the return button is hit
        
        
       /* if textField.text?.lowercased() == word.unscrambled {
            
        }
 */
        
        
    }
    

    @IBAction func newWordButton(_ sender: UIButton) {
        newWordButton.isEnabled = false
        newWordButton.setTitleColor(UIColor.white, for: .normal)
        word = Word.getRandomWord()
         scrambledWord.text = word.scrambled
        
        textField.text = ""
        
    }
    
}
extension ViewController: UITextFieldDelegate {

     func textField(_ textField: UITextField,
                    shouldChangeCharactersIn range: NSRange,
                    replacementString string: String) -> Bool {
//        if scrambledWord.text!.contains(textField.text)
        
        for char in scrambledWord.text {
            if char == textField.text?.last {
                /*scrambledWord.text.remove(at: scrambledWord.firstIndex)
 */
            }
        }
         if let oldString = textField.text {
             let newString = oldString.replacingCharacters(in: Range(range, in: oldString)!,
                                                           with: string)
            print("NewString:", newString)
            print("OldString:", oldString)
            
            
         } else if textField.text == "" {
            
         
         } else {
            return false
        }
       return true
    }
        
        
        
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        newWordButton.isEnabled = true
        newWordButton.setTitleColor(UIColor.blue, for: .normal)
        
        
      return true
    }
    
    
}


