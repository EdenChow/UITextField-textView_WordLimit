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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.MaxCharLength = 10
        
    }
    
    func textFieldTextLengthDidChange(textFeild: UITextField, length: Int) {
        print(length)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

