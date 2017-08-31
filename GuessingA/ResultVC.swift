//
//  ResultVC.swift
//  GuessingA
//
//  Created by Saravanan on 31/08/17.
//  Copyright © 2017 Twilight-MAC. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    var strOutPut : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Result"
        if(strOutPut != nil){
           lblResult.text = strOutPut
        }
        
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var lblResult: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
