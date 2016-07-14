//
//  ViewController.m
//  OC_Version
//
//  Created by 石文文 on 16/7/14.
//  Copyright © 2016年 石文文. All rights reserved.
//

#import "ViewController.h"
#import "WordLimit.h"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *fieldMaxLength;
@property (weak, nonatomic) IBOutlet UITextField *textViewMaxLength;
@property (weak, nonatomic) IBOutlet UILabel *fieldCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *textViewCountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldLengthNoti:) name:UITextFieldTextLengthDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewLengthNoti:) name:UITextViewTextLengthDidChangeNotification object:nil];
    
}
- (void)textFieldLengthNoti:(NSNotification *)noti{
    
    UITextField *textField = (UITextField *)noti.object;
    if ([textField isEqual:self.textField]) {
       self.fieldCountLabel.text = [NSString stringWithFormat:@"textField字数%lu",textField.text.length];
    }
    
    
}
- (void)textViewLengthNoti:(NSNotification *)noti{
    
    UITextView *textView = (UITextView *)noti.object;
    if ([textView isEqual:self.textView]) {
        self.textViewCountLabel.text = [NSString stringWithFormat:@"textField字数%lu",textView.text.length];
    }
    
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if ([self.fieldMaxLength isEqual:textField]) {
        
        self.textField.maxCharLength = [textField.text integerValue];
        
    }else if ([self.textViewMaxLength isEqual:textField]){
        
        self.textView.maxCharLength = [textField.text integerValue];
        
        
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
