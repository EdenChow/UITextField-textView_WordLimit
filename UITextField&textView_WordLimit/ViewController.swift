//
//  ViewController.swift
//  UITextField&textView_WordLimit
//
//  Created by 石文文 on 16/7/7.
//  Copyright © 2016年 石文文. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textFieldCountLabel: UILabel!
    
    @IBOutlet weak var textViewCountLabel: UILabel!
    
    @IBOutlet weak var textFieldMaxLength: UITextField!
    
    
    @IBOutlet weak var textViewMaxLength: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.textViewLengthNoti(_:)) , name: UITextViewTextLengthDidChangeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.textFieldLengthNoti(_:)) , name: UITextFieldTextLengthDidChangeNotification, object: nil)
        
    }
    
    
    func textViewLengthNoti(noti:NSNotification) {
        
        let textView  = noti.object as! UITextView //可通过textView对象判断当前的textView是哪一个
        print("textView字数：\(textView.text!.length)")
        textViewCountLabel.text = "textView字数：\(textView.text!.length)"
        
        
        
    }
    func textFieldLengthNoti(noti:NSNotification) {
        
        let textField  = noti.object as! UITextField //可通过textField对象判断当前的textField是哪一个
        print("textField字数：\(textField.text!.length)")
        textFieldCountLabel.text = "textField字数：\(textField.text!.length)"
        
    }
   
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        if textField === self.textField {
           
            
        }else{
            
            if textField === textFieldMaxLength {
                
                if textField.text?.length > 0{
                    self.textField.MaxCharLength = Int(textField.text!)!
                    
                }else{
                    self.textField.MaxCharLength = Int.max
                }
                
            }else{
                if textField.text?.length > 0{
                    self.textView.MaxCharLength = Int(textField.text!)!
                    
                }else{
                    self.textView.MaxCharLength = Int.max
                }
            }
           

            
        }
        
        return true
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

