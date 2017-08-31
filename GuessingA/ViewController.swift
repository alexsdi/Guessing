//
//  ViewController.swift
//  GuessingA
//
//  Created by Saravanan on 31/08/17.
//  Copyright © 2017 Twilight-MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNum1A: UITextField!
    @IBOutlet weak var txtNum1C: UITextField!
    @IBOutlet weak var txtNum1B: UITextField!
    
    
    @IBOutlet weak var txtNum2C: UITextField!
    @IBOutlet weak var txtNum2B: UITextField!
    @IBOutlet weak var txtNum2A: UITextField!
    
    var aResult = ""
    var bResult = ""
    var cResult = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        
        let A_posibilities = "A = " + calculateResult(rotateCount(num1A, num2: num2A), previousNum: num2A)
        let B_posibilities = "B = " + calculateResult(rotateCount(num1B, num2: num2B), previousNum: num2B)
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
        
        let rotate1 = Float(rotate) + ( Float(rotate) / 2)
        
        let rotate2 = (Float(rotate) / 4) + (Float(rotate) / 2)
        
        let rotate3 = Float(rotate) / 5
        
        let rotate4 = Float(rotate) / 0.7
        
        var AOption = ""
        
        let R1 = lroundf(rotate1)
        AOption = AOption + ", " + finalValue(R1, previousNum: previousNum)
        if(Float(lroundf(rotate1)) > rotate1){
            let R2 = lroundf(rotate1) - 1
            AOption = AOption + ", "  + finalValue(R2, previousNum: previousNum)
        }
        
        let R3 = lroundf(rotate2)
        AOption = AOption  + ", " + finalValue(R3, previousNum: previousNum)
        if(Float(lroundf(rotate2)) > rotate2){
            let R4 = lroundf(rotate2) - 1
            AOption = AOption  + ", " + finalValue(R4, previousNum: previousNum)
        }
      
        if(rotate > 5){
            let R5 = lroundf(rotate3)
            AOption = AOption  + ", " + finalValue(R5, previousNum: previousNum)
            if(Float(lroundf(rotate3)) > rotate3){
                let R6 = lroundf(rotate3) - 1
                AOption = AOption  + ", " + finalValue(R6, previousNum: previousNum)
            }
        }
        
        let R7 = lroundf(rotate4)
        AOption = AOption  + ", " + finalValue(R7, previousNum: previousNum)
        
        if(Float(lroundf(rotate4)) > rotate4){
            let R8 = lroundf(rotate4) - 1
            AOption = AOption  + ", " + finalValue(R8, previousNum: previousNum)
        }

        return AOption
    }
    
    
    func finalValue(rotate : Int , previousNum : Int) -> String{
        
        var currentNum = previousNum + rotate
    
        if(currentNum > 9){
            currentNum = currentNum - 10
        }

        return String(currentNum)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}

