//
//  ViewController.swift
//  LSLoadingNoticeDemo
//
//  Created by Shawn Li on 15/7/13.
//  Copyright (c) 2015年 Shawn Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loading(sender: AnyObject) {
        self.pleaseLoading();
    }

    
    @IBAction func loadingWithText(sender: AnyObject) {
        self.loadingNoticeWithText("loading");
    }
    
    @IBAction func showSuccessNotice(sender: AnyObject) {
        self.successNotice("success");
    }
    
    @IBAction func showErrorNotice(sender: AnyObject) {
        self.errorNotice("Error!");
    }
    
    @IBAction func showInfoNotice(sender: AnyObject) {
        self.infoNotice("Info");
    }
    
    @IBAction func showTextNotice(sender: AnyObject) {
        //self.showNoticeText("我是一个notice text，我喜欢提醒你做各种不同的事情哦，请好好关照我。");//提示长文字测试
        self.showNoticeText("我是notice");
    }
    
    @IBAction func showTopNotice(sender: AnyObject) {
        self.noticeOnTop("大豆比是小朋友");
    }
    
    @IBAction func dismissNotice(sender: AnyObject) {
        self.dismissNotice();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

