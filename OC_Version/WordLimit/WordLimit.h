//
//  WordLimit.h
//  UITextField&textView_WordLimit
//
//  Created by 石文文 on 16/7/14.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *UITextFieldTextLengthDidChangeNotification = @"UITextFieldTextLengthDidChangeNotification";
@interface UITextField (wordLimit)
    
@property (nonatomic,assign)NSInteger maxCharLength;

@end


static NSString *UITextViewTextLengthDidChangeNotification = @"UITextViewTextLengthDidChangeNotification";
@interface UITextView (wordLimit)

@property (nonatomic,assign)NSInteger maxCharLength;

@end