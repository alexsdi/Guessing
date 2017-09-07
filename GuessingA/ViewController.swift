//
//  ViewController.swift
//  GuessingA
//
//  Created by Saravanan on 31/08/17.
//  Copyright © 2017 Twilight-MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var txtNum1A: UITextField!
    @IBOutlet weak var txtNum1C: UITextField!
    @IBOutlet weak var txtNum1B: UITextField!

    @IBOutlet weak var txtNum2C: UITextField!
    @IBOutlet weak var txtNum2B: UITextField!
    @IBOutlet weak var txtNum2A: UITextField!
    
    var aResult = ""
    var bResult = ""
    var cResult = ""
    var AOption : String!
    
    var currentTextfield : UITextField!
    var currentBoard = 0
    @IBOutlet weak var txtOmitA: UITextField!
    @IBOutlet weak var txtOmitB: UITextField!
    @IBOutlet weak var txtOmitC: UITextField!
    
    @IBAction func onClear(sender: AnyObject) {
        //941
        //872
        
        txtNum1A.text = ""
        txtNum1C.text = ""
        txtNum1B.text = ""
        
        txtNum2C.text = ""
        txtNum2B.text = ""
        txtNum2A.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        AOption =  ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        if(textField == txtOmitA || textField == txtOmitB || textField == txtOmitC){
            
            return true
            
        }
        
        if(textField.text?.characters.count > 0){
            
            if (textField.tag == 6) {
                
                textField.resignFirstResponder()
                
                return false
            }
            if let nextTextField =  self.view.viewWithTag(currentTextfield.tag + 1) as? UITextField{
                
                nextTextField.becomeFirstResponder()
                
            }
            
        }
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        
        currentTextfield = textField
  
        
    }
    
    @IBAction func onCalculate(sender: UIButton) {
        
        self.view.endEditing(true)
        
        if(txtNum1A.text?.characters.count == 0 || txtNum1B.text?.characters.count == 0 || txtNum1C.text?.characters.count == 0 || txtNum2A.text?.characters.count == 0 || txtNum2B.text?.characters.count == 0 || txtNum2C.text?.characters.count == 0){
            
            return
        }

        let num1A = Int(txtNum1A.text!)!
        let num1B = Int(txtNum1B.text!)!
        let num1C = Int(txtNum1C.text!)!
        
        let num2A = Int(txtNum2A.text!)!
        let num2B = Int(txtNum2B.text!)!
        let num2C = Int(txtNum2C.text!)!
        
        currentBoard = 1
        let A_posibilities = "A = " + calculateResult(rotateCount(num1A, num2: num2A), previousNum: num2A)
        
        currentBoard = 2
        let B_posibilities = "B = " + calculateResult(rotateCount(num1B, num2: num2B), previousNum: num2B)
        
        currentBoard = 3
        let C_posibilities = "C = " + calculateResult(rotateCount(num1C, num2: num2C), previousNum: num2C)
        
        
        let outStr = A_posibilities + "\n" + B_posibilities + "\n" + C_posibilities
        
        
        let resultVC = self.storyboard?.instantiateViewControllerWithIdentifier("ResultVC") as! ResultVC
        resultVC.strOutPut = outStr
        
        self.navigationController?.pushViewController(resultVC, animated: true)
        
    }
    
    
    func rotateCount (num1: Int,num2 :Int) -> Int{
        
        var rot = num2 - num1
        
        if(rot < 0){
            rot = 10 + rot
        }
        
        return rot
        
    }
    
    func calculateResult(rotate : Int, previousNum : Int) ->String{
        
        AOption =  ""
        //Find Rotation count
        let rotate1 = Float(rotate) + ( Float(rotate) / 2)
        let rotate2 = (Float(rotate) / 4) + (Float(rotate) / 2)
        let rotate3 = Float(rotate) / 5
        let rotate4 = Float(rotate) / 0.7
        let rotate5 = Float(rotate)
        let rotate6 = Float(rotate) / 2.0
        let rotate7 = Float(rotate) + 1.0
        let rotate8 = Float(rotate) + 2.0
        
        let rotate9 = Float(rotate) - 1.0
        let rotate10 = Float(rotate) - 2.0
        let rotate11 = (Float(rotate) / 2.0) + 1.0
        let rotate12 = (Float(rotate) / 5.0) + 1.0
        let rotate13 = (Float(rotate) / 5.0) - 1.0
        let rotate14 = Float(rotate) * 2.0
        let rotate15 = (Float(rotate) / 4)
        let rotate16 = Float(rotate) + 4.0

        
        AOption = AOption + getValue(rotate2, previousNum: previousNum)
        
        AOption = AOption + getValue(rotate5, previousNum: previousNum)
        AOption = AOption + getValue(rotate6, previousNum: previousNum)
        AOption = AOption + getValue(rotate7, previousNum: previousNum)
        AOption = AOption + getValue(rotate8, previousNum: previousNum)
        AOption = AOption + getValue(rotate9, previousNum: previousNum)
        AOption = AOption + getValue(rotate10, previousNum: previousNum)
        AOption = AOption + getValue(rotate11, previousNum: previousNum)
        AOption = AOption + getValue(rotate15, previousNum: previousNum)
        AOption = AOption + getValue(rotate16, previousNum: previousNum)
        
        if(rotate < 6){
            AOption = AOption + getValue(rotate1, previousNum: previousNum)
            AOption = AOption + getValue(rotate4, previousNum: previousNum)
        }
        if(rotate < 5){
            
            AOption = AOption + getValue(rotate14, previousNum: previousNum)
            
        }
        if(rotate > 5){
            
            AOption = AOption + getValue(rotate3, previousNum: previousNum)
            AOption = AOption + getValue(rotate12, previousNum: previousNum)
            AOption = AOption + getValue(rotate13, previousNum: previousNum)
            
        }
        switch rotate {
        case 9:
                AOption = AOption + getValue(1, previousNum: previousNum)
                break;
        case 1:
            AOption = AOption + getValue(9, previousNum: previousNum)
            break;
        case 10:
            AOption = AOption + getValue(4, previousNum: previousNum)
            break;
        case 10:
            AOption = AOption + getValue(5, previousNum: previousNum)
            break;
        case 6:
            AOption = AOption + getValue(4, previousNum: previousNum)
            break;
        case 4:
            AOption = AOption + getValue(7, previousNum: previousNum)
            AOption = AOption + getValue(6, previousNum: previousNum)
            break;
        case 5:
            AOption = AOption + getValue(7, previousNum: previousNum)
            AOption = AOption + getValue(6, previousNum: previousNum)
            break;
        case 6:
            AOption = AOption + getValue(9, previousNum: previousNum)
            AOption = AOption + getValue(3, previousNum: previousNum)
            break;
        case 3:
            AOption = AOption + getValue(7, previousNum: previousNum)
            AOption = AOption + getValue(5, previousNum: previousNum)
            break;
        case 9:
            AOption = AOption + getValue(1, previousNum: previousNum)
            AOption = AOption + getValue(2, previousNum: previousNum)
            break;
        case 8:
            AOption = AOption + getValue(2, previousNum: previousNum)
            AOption = AOption + getValue(9, previousNum: previousNum)
            break;
        case 2:
            AOption = AOption + getValue(8, previousNum: previousNum)
            AOption = AOption + getValue(6, previousNum: previousNum)
            break;
        default: break
           
        }
        
        if(rotate==0 || rotate==1)
        {
            return calculateResult(10, previousNum: previousNum);
        }
        return AOption
    }
    
    

    func getValue(rotate : Float, previousNum : Int) -> String{
        
        var outString = ""
        var R9 = lroundf(rotate)
        
        var txtOmit : UITextField!
        
        if(currentBoard == 1){
            txtOmit = txtOmitA
        }else if(currentBoard == 2){
            txtOmit = txtOmitB
        }else{
            txtOmit = txtOmitC
        }
        if txtOmit.text!.rangeOfString(String(R9)) == nil{
            
            if(finalValue(R9, previousNum: previousNum) != ""){
                if(AOption == ""){
                    outString = finalValue(R9, previousNum: previousNum)
                }else{
                    outString = outString  + ", " + finalValue(R9, previousNum: previousNum)
                }
                
            }
        }
        
        if(Float(lroundf(rotate)) > rotate){
            R9 = lroundf(rotate) - 1

            if txtOmit.text!.rangeOfString(String(R9)) == nil{
                if(finalValue(R9, previousNum: previousNum) != ""){
                    
                    if(AOption == ""){
                        outString = finalValue(R9, previousNum: previousNum)
                    }else{
                        outString = outString  + ", " + finalValue(R9, previousNum: previousNum)
                    }
                    
                }
            }
            
           
        }
        
        return outString
    }
    
    
    func finalValue(rotate : Int , previousNum : Int) -> String{
        
        var currentNum = previousNum + rotate
        
        if(currentNum > 9){
            currentNum = currentNum - 10
        }
        
        if(checkExist(String(currentNum)) == true){
            return String(currentNum)
        }else{
            return ""
        }
        
        
    }
    
    func checkExist(checkString : String)->Bool{
      
        if AOption.rangeOfString(String(checkString)) != nil{
             return false
        }
          return true
       
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
   
}

