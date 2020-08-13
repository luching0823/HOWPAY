//
//  howToPayViewController.swift
//  HOWPAY
//
//  Created by 廖昱晴 on 2020/8/4.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import UIKit


class howToPayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var cardTextField: UITextField!
    @IBOutlet weak var weekTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    
    @IBOutlet var cardPickerView: UIPickerView!
    @IBOutlet var weekPickerView: UIPickerView!
    @IBOutlet var typePickerView: UIPickerView!

    
    
    var card = ["Line Pay卡", "大戶卡", "@GOGO卡", "街口聯名卡", "Pi錢包聯名卡"]
    var week = ["每日", "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
    var type = ["日常用品","百貨公司", "美妝保養", "餐廳美食", "飲料", "服飾包鞋", "3C產品", "電影院"]

    
    //有幾個區塊
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //裡面有幾列
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return card.count
        } else if pickerView.tag == 1 {
            return week.count
        } else if pickerView.tag == 2{
            return type.count
        }
        return 1
    }
    
    //選到的那列要做的事
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 0 {
            cardTextField.text = card[row]
        } else if pickerView.tag == 1 {
            weekTextField.text = week[row]
        } else if pickerView.tag == 2 {
            typeTextField.text = type[row]
        }
    }
    
    //設定每列PickerView要顯示的內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView.tag == 0 {
            return card[row]
        } else if pickerView.tag == 1 {
            return week[row]
        } else if pickerView.tag == 2{
            return type[row]
        }
        return ""
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //pickerView
        
        cardPickerView = UIPickerView()
        weekPickerView = UIPickerView()
        typePickerView = UIPickerView()
        
        cardPickerView.tag = 0
        weekPickerView.tag = 1
        typePickerView.tag = 2
        //設定代理人和資料來源為viewController
        cardPickerView.delegate = self
        weekPickerView.delegate = self
        typePickerView.delegate = self


        //讓textField的輸入方式改為pickerView
        cardTextField.inputView = cardPickerView
        weekTextField.inputView = weekPickerView
        typeTextField.inputView = typePickerView
        
        //加上手勢按鈕
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        
        

        // Do any additional setup after loading the view.
    }
    @objc func closeKeyboard() {
        self.view.endEditing(true)
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


