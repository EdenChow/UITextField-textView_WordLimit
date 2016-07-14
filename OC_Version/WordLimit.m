//
//  WordLimit.m
//  UITextField&textView_WordLimit
//
//  Created by 石文文 on 16/7/14.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import "WordLimit.h"
#import <objc/runtime.h>
NSString const*textFieldlengthKey = @"textFieldlengthKey";

@implementation UITextField (wordLimit)

-(void)setMaxCharLength:(NSInteger)maxCharLength{
    

    objc_setAssociatedObject(self, &textFieldlengthKey, @(maxCharLength), OBJC_ASSOCIATION_ASSIGN);
    
    [self addTarget:self action:@selector(textFieldEditingChange) forControlEvents:UIControlEventEditingChanged];
}
-(NSInteger)maxCharLength{
    
    
    
    return [objc_getAssociatedObject(self, &textFieldlengthKey) integerValue];
}

- (void)textFieldEditingChange{
    
    if (self.markedTextRange) {
        
        if ([self positionFromPosition:self.markedTextRange.start offset:0]) {
            
            
            
        }else{
            
           [self checkLength];
        }
        
        
    }else{
        
        [self checkLength];
    }
    
    
    
}
- (void)checkLength{
    
    if (self.text.length <= self.maxCharLength) {
        
        [[NSNotificationCenter defaultCenter]postNotificationName:UITextFieldTextLengthDidChangeNotification object:self];
        
    }else{
        
        for (NSInteger i = self.text.length-1; i >= 0; i--) {
            
            NSString *text = [self.text substringToIndex:i];
            
            if (text.length <= self.maxCharLength) {
                
                self.text = text;
                
                [[NSNotificationCenter defaultCenter]postNotificationName:UITextFieldTextLengthDidChangeNotification object:self];
                break;
            }
            
        }
        
        
    }
    
}

@end


NSString const *textViewlengthKey = @"textViewlengthKey";

@implementation UITextView (wordLimit)

-(void)setMaxCharLength:(NSInteger)maxCharLength{
    
    
    objc_setAssociatedObject(self, &textViewlengthKey, @(maxCharLength), OBJC_ASSOCIATION_ASSIGN);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEditingChange) name:UITextViewTextDidChangeNotification object:nil];
    
}
-(NSInteger)maxCharLength{
    
    
    
    return [objc_getAssociatedObject(self, &textViewlengthKey) integerValue];
}

- (void)textFieldEditingChange{
    
    if (self.markedTextRange) {
        
        if ([self positionFromPosition:self.markedTextRange.start offset:0]) {
            
            
            
        }else{
            
            [self checkLength];
        }
        
        
    }else{
        
        [self checkLength];
    }
    
    
    
}
- (void)checkLength{
    
    if (self.text.length <= self.maxCharLength) {
        
        [[NSNotificationCenter defaultCenter]postNotificationName:UITextViewTextLengthDidChangeNotification object:self];
        
    }else{
        
        for (NSInteger i = self.text.length-1; i >= 0; i--) {
            
            NSString *text = [self.text substringToIndex:i];
            
            if (text.length <= self.maxCharLength) {
                
                self.text = text;
                
                [[NSNotificationCenter defaultCenter]postNotificationName:UITextViewTextLengthDidChangeNotification object:self];
                break;
            }
            
        }
        
        
    }
    
}


@end