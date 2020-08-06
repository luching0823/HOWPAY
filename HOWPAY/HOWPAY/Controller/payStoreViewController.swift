//
//  payStoreViewController.swift
//  HOWPAY
//
//  Created by 廖昱晴 on 2020/8/5.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import UIKit

class payStoreViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pay1: UITextField!
    @IBOutlet weak var pay2: UITextField!
    @IBOutlet weak var pay3: UITextField!
    
    @IBOutlet var payPickerView1: UIPickerView!
    @IBOutlet var payPickerView2: UIPickerView!
    @IBOutlet var payPickerView3: UIPickerView!
    
    var payment1 = ["LINE PAY", "Apple Pay", "Samsung Pay", "Google Pay", "街口支付", "Pi錢包", "台灣Pay"]
    var payment2 = ["LINE PAY", "Apple Pay", "Samsung Pay", "Google Pay", "街口支付", "Pi錢包", "台灣Pay"]
    var payment3 = ["LINE PAY", "Apple Pay", "Samsung Pay", "Google Pay", "街口支付", "Pi錢包", "台灣Pay"]
    
    //有幾個區塊
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //裡面有幾列
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return payment1.count
        } else if pickerView.tag == 1 {
            return payment2.count
        } else if pickerView.tag == 2{
            return payment3.count
        }
        return 1
    }
    
    //選到的那列要做的事
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView.tag == 0 {
                pay1.text = payment1[row]
            } else if pickerView.tag == 1 {
                pay2.text = payment2[row]
            } else if pickerView.tag == 2 {
                pay3.text = payment3[row]
            }
    }
    
    //設定每列PickerView要顯示的內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView.tag == 0 {
                return payment1[row]
            } else if pickerView.tag == 1 {
                return payment2[row]
            } else if pickerView.tag == 2{
                return payment3[row]
            }
            return ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        payPickerView1 = UIPickerView()
        payPickerView2 = UIPickerView()
        payPickerView3 = UIPickerView()
        
        payPickerView1.tag = 0
        payPickerView2.tag = 1
        payPickerView3.tag = 2
        //設定代理人和資料來源為viewController
        payPickerView1.delegate = self
        payPickerView2.delegate = self
        payPickerView3.delegate = self


        //讓textField的輸入方式改為pickerView
        pay1.inputView = payPickerView1
        pay2.inputView = payPickerView2
        pay3.inputView = payPickerView3
        
        
        //手勢按鈕
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
