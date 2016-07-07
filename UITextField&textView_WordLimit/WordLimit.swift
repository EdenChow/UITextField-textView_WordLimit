//
//  WordLimit.swift
//  UITextField&textView_WordLimit
//
//  Created by 石文文 on 16/7/7.
//  Copyright © 2016年 石文文. All rights reserved.
//

import UIKit
import ObjectiveC
private var textLength = Int.max
extension UITextFieldDelegate{
    
    
    func textFieldTextLengthDidChange(textFeild:UITextField,length:Int){
        
        
        
    }
    
}

public extension UITextField{
    
    
    /// 最大输入长度
  public  var MaxCharLength:Int{
        //通过运行时添加实例属性
        set{
            
             objc_setAssociatedObject(self, &textLength, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            
            
            self.addTarget(self, action: #selector(UITextField.textFieldEditingChange(_:)), forControlEvents: .EditingChanged)
            
            
        }
        get{
            
             return (objc_getAssociatedObject(self, &textLength) as? Int)!
            
        }
        
    }

    /**
     编辑中
     
     - parameter textField: 当前编辑的textField
     */
    func textFieldEditingChange(textField:UITextField ) {
        
        if let _ = textField.text {
            if let positionRange = textField.markedTextRange {
                
                if let _ = textField.positionFromPosition(positionRange.start, offset: 0) {
                    //正在使用拼音，不进行校验
                    
                    
                    
                } else {
                    //不在使用拼音，进行校验
                    
                    self.checkLength(textField)
                }
                
            } else {
                
                //不在使用拼音，进行校验
                self.checkLength(textField)
            }
        }

    }
    
    
    /**
     长度检测
     
     - parameter textField: 当前检测的textField
     */
    func checkLength(textField:UITextField) {
        if let text = textField.text {
            if text.length <= self.MaxCharLength {
                //长度正常，不处理
                
//                print(text.length)
                
                if self.delegate != nil {

                    self.delegate!.textFieldTextLengthDidChange(textField, length: text.length)
                    
                }
                
                
                
            } else {
                
                //超出长度，开始处理
                print("输入文字过长")
                
                let len = text.length
                
                if len > 0 {
                    
                    //进行截取
                    
                    for i in 1..<len {
                        
                        let j = len - i
                        
                        let txt = text.substringToIndex(text.startIndex.advancedBy(j))
//                        print("txt : \(txt)")
                        if  txt.length <= self.MaxCharLength{
                            //截取结束
                            textField.text = txt
                            if self.delegate != nil {
                                
                                self.delegate!.textFieldTextLengthDidChange(textField, length: text.length)
                                
                            }
                            
                            break
                        }
                    }
                    
                }
            }
        }
        
        
        
    }
    
    
    
}




extension UITextView{
    
    
    
    
    
    
    
    
}

extension String{
    
    /// 字符串长度
    
    var length:Int{
        
        
        get{
            
            return self.characters.count
            
        }
        
        
    }
    
    
}