//
//  ResultVC.swift
//  GuessingA
//
//  Created by Saravanan on 31/08/17.
//  Copyright © 2017 Twilight-MAC. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var lblTotCount: UILabel!
    var strOutPut : String!
    var checkPrevious = ""
    @IBOutlet weak var totAmount: UILabel!
    @IBOutlet weak var txtPosibility: UITextView!
    var arrAPosibility : [String]!
    var arrBPosibility : [String]!
    var arrCPosibility : [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Result"
        
        checkPrevious = "090 006 980 204 259 263 506 855 949 861 208 448 400 922 668 473 758 361 335 668 514 618 918 666 005 201 651 136 641 914 172 580 813 351 033 355 348 003 052 322 678 315 171 213 184 961 760 347 223 381 303 411 330 117 882 255 138 586 337 111 464 757 769 381 167 572 742 462 945 535 346 842 549 439 262 520 429 715 412 063 313 483 259 309 076 650 812 624 580 115 981 029 405 787 346 640 360 277 313 512 588 608 378 932 523 088 106 874 563 745 350 632 045 922 062 648 827 452 577 611 124 662 379 397 871 359 222 039 275 563 129 743 504 589 233 835 976 126 831 102 866 796 698 619 070 508 227 648 143 570 427 065 513 344 535 646 992 902 053 681 326 524 100 541 421 905 419 055 177 529 584 211 158 148 587 904 876 049 232 598 002 441 116 966 166 213 582 387 333 512 991 168 776 500 721 698 530 055 896 619 385 820 417 595 670 212 062 649 153 782 438 716 124 748 834 904 466 757 505 234 728 132 763 021 198 011 981 980 781 954 207 882 321 395 831 140 668 956 237 050 498 277 151 945 581 973 679 972 257 776 183 238 649 859 047 856 100 812 069 546 841 028 124 941 778 934 300 208 775 943 349 177 595 101 266 076 648 767 483 884 439 773 717 984 070 604 646 129 114 797 356 718 582 009 284 374 249 987 458 663 245 850 119 163 776 532 819 638 349 016 590 156 931 945 438 462 015 184 358 447 379 467 473 913 269 912 416 941 870 183 655 168 242 595 350 527 249 417 658 722 645 717 591 851 540 316 436 485 341 345 080 353 278 364 205 593 675 881 665 930 659 894 879 674 023 027 148 620 292 319 887 582 406 768 653 487 485 336 625 661 624 593 410 378 459 815 383 751 258 947 569 499 156 947 641 243 499 997 187 526 206 658 040 645 954 381 960 608 988 919 146 245 146 872"
        
        if(strOutPut != nil){
           lblResult.text = strOutPut
        }
        
        
        arrAPosibility = strOutPut.componentsSeparatedByString("\n")[0].componentsSeparatedByString("=")[1].componentsSeparatedByString(",")
        arrBPosibility = strOutPut.componentsSeparatedByString("\n")[1].componentsSeparatedByString("=")[1].componentsSeparatedByString(",")
        arrCPosibility = strOutPut.componentsSeparatedByString("\n")[2].componentsSeparatedByString("=")[1].componentsSeparatedByString(",")
        
       
        filter(false)
        
        
        
        // Do any additional setup after loading the view.
    }

    
    func filter(isFilter : Bool){
        
        var fullPosibility = "";
        var count = 0
        for posA in arrAPosibility{
            for posB in arrBPosibility{
                for posC in arrCPosibility{
                    let posibility = "\(posA.trim())\(posB.trim())\(posC.trim()), "
                    
                    if(isFilter == true){
                        if(!checkPrevious.containsString("\(posA.trim())\(posB.trim())\(posC.trim())")){
                            count = count + 1
                            fullPosibility = fullPosibility + posibility
                        }
                    }else{
                        count = count + 1
                        fullPosibility = fullPosibility + posibility
                    }

                }
            }
        }
        
        txtPosibility.text = fullPosibility
        lblTotCount.text = "Count : \(count)"
        totAmount.text = "Amount : \(count * 30)"
    }
    @IBOutlet weak var lblResult: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onFilter(sender: AnyObject) {
        
        
        filter(true)
        
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
