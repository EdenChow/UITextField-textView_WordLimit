# UITextField-textView_WordLimit
基于swift给textfield和textView添加扩展 监听限制输入长度   包括中文输入状态下 只需设置最大长度即可
====================
使用方法
  将WordLimit.swift拖入项目即可
  给textField或者textview设置MaxCharLength（允许输入的最大字符数）属性，则输入框最多输入给MaxCharLength长度的字符数。
  如果需要展示或者需要对当前输入的字符数进行处理，通过监听UITextViewTextLengthDidChangeNotification或UITextFieldTextLengthDidChangeNotification
  
  如 
   
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.textViewLengthNoti(_:)) , name: UITextViewTextLengthDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.textFieldLengthNoti(_:)) , name: UITextFieldTextLengthDidChangeNotification, object: nil)
    }
    
    
    func textViewLengthNoti(noti:NSNotification) {
        let textView  = noti.object as! UITextView //可通过textView对象判断当前的textView是哪一个
        print("textView字数：\(textView.text!.length)")
    }
    func textFieldLengthNoti(noti:NSNotification) {
        let textField  = noti.object as! UITextField //可通过textField对象判断当前的textField是哪一个
        print("textField字数：\(textField.text!.length)")
    }

