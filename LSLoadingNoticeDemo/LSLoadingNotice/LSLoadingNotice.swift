//
//  LSLoadingNotice.swift
//  LSLoadingNoticeDemo
//
//  Created by Shawn Li on 15/7/13.
//  Copyright (c) 2015年 Shawn Li. All rights reserved.
//

import Foundation
import UIKit

//扩展
extension UIViewController {
    func noticeOnTop(text: String) {
        LSLoadingNotice.noticeOnStatusBar(text, dismiss: true);
    }
    func noticeOnTop(text: String, dismiss: Bool) {
        LSLoadingNotice.noticeOnStatusBar(text, dismiss: dismiss);
    }
    func successNotice(text: String) {
        LSLoadingNotice.loadingNoticeWithText(text, type: .Success, dismiss: true);
    }
    func successNotice(text: String, dismiss: Bool) {
        LSLoadingNotice.loadingNoticeWithText(text, type: .Success, dismiss: dismiss);
    }
    func errorNotice(text: String) {
        LSLoadingNotice.loadingNoticeWithText(text, type: .Error, dismiss: true);
    }
    func errorNotice(text: String, dismiss: Bool) {
        LSLoadingNotice.loadingNoticeWithText(text, type: .Error, dismiss: true);
    }
    func infoNotice(text: String) {
        LSLoadingNotice.loadingNoticeWithText(text, type: .Info, dismiss: true);
    }
    func infoNotice(text: String, dismiss: Bool) {
        LSLoadingNotice.loadingNoticeWithText(text, type: .Info, dismiss: dismiss);
    }
    func showNotice(text: String, type: LSLoadingNoticeType, dismiss: Bool) {
        LSLoadingNotice.loadingNoticeWithText(text, type: type, dismiss: dismiss);
    }
    func pleaseLoading() {
        LSLoadingNotice.loading();
    }
    
    func loadingNoticeWithText(text: String) {
        LSLoadingNotice.loadingWithText(text, dismiss: true);
    }

    func loadingWithNoticeText(text: String, dismiss: Bool) {
        LSLoadingNotice.loadingWithText(text, dismiss: dismiss);
    }
    func showNoticeText(text: String) {
        LSLoadingNotice.showText(text);
    }
    func dismissNotice() {
        LSLoadingNotice.clear();
    }
    func dismissAllNotice() {
        LSLoadingNotice.clear();
    }
}


enum LSLoadingNoticeType {//提示内容类型
    case Success
    case Error
    case Info
}
class LSLoadingNotice: NSObject {
    static var windows = Array<UIWindow!>();
    static let rootview = UIApplication.sharedApplication().keyWindow?.subviews.first as! UIView;
    
    static func clear() {
        for window in windows {
            window.hidden = true;
        }
    }
    
    /*! 在导航栏上显示提示 */
    static func noticeOnStatusBar(text: String, dismiss: Bool) {
        let frame = UIApplication.sharedApplication().statusBarFrame;
        let window = UIWindow(frame: frame);
        window.backgroundColor = UIColor.clearColor();
        let view = UIView(frame: frame);
        view.backgroundColor = UIColor(red: 106/255.0, green: 180/255.0, blue: 159/255.0, alpha: 1.0);
        
        let label = UILabel(frame: frame);
        label.textAlignment = NSTextAlignment.Center;
        label.font = UIFont.systemFontOfSize(12);
        label.textColor = UIColor.whiteColor();
        label.text = text;
        view.addSubview(label);
        
        window.windowLevel = UIWindowLevelStatusBar;
        window.hidden = false;
        window.addSubview(view);
        windows.append(window);
        
        if (dismiss) {
            let selector = Selector("hideNotice:");
            self.performSelector(selector, withObject: view, afterDelay: 2.0);
        }
    }
    
    static func loading() {//正在加载
        let frame = CGRectMake(0, 0, 80, 80);
        let window = UIWindow(frame: frame);
        window.backgroundColor = UIColor.clearColor();
        let mainView = UIView(frame: frame);
        mainView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7);
        mainView.layer.cornerRadius = 15;
        
        let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge);
        indicatorView.frame = CGRectMake(20, 20, 40, 40);
        indicatorView.startAnimating();
        mainView.addSubview(indicatorView);
        
        window.windowLevel = UIWindowLevelAlert;
        window.center = rootview.center;
        window.hidden = false;
        window.addSubview(mainView);
        windows.append(window);
    }
    
    static func showText(text: String) {
        let window = UIWindow();
        window.backgroundColor = UIColor.clearColor();
        let mainView = UIView();
        mainView.layer.cornerRadius = 10;
        mainView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7);
        
        let label = UILabel();
        label.text = text;
        label.numberOfLines = 0;
        label.font = UIFont.systemFontOfSize(13);
        //label.textAlignment = NSTextAlignment.Center;
        label.textColor = UIColor.whiteColor();
        label.sizeToFit();
        if (label.frame.size.width > 100) {
            label.frame.size.width = 200;
            label.frame.size.height = (text as NSString).boundingRectWithSize(CGSizeMake(200, CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin | NSStringDrawingOptions.UsesFontLeading, attributes: [NSFontAttributeName: label.font], context: nil).size.height;
        } else {
            label.frame.size.width = 100;
            label.sizeToFit();
        }
        //println("\(label.frame)");
        mainView.addSubview(label);
        
        let superFrame = CGRectMake(0, 0, label.frame.size.width + 50, label.frame.size.height + 30);
        window.frame = superFrame;
        mainView.frame = superFrame;
        label.center = mainView.center;
        
        window.windowLevel = UIWindowLevelAlert;
        window.center = rootview.center;
        window.hidden = false;
        window.addSubview(mainView);
        windows.append(window);
    }
    
    static func loadingWithText(text: String?, dismiss: Bool) {//菊花加文字
        let frame = CGRectMake(0, 0, 80, 80);
        let window = UIWindow(frame: frame);
        window.backgroundColor = UIColor.clearColor();
        let mainView = UIView(frame: frame);
        mainView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7);
        mainView.layer.cornerRadius = 15;
        
        let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge);
        indicatorView.frame = CGRectMake(20, 20, 40, 40);
        indicatorView.startAnimating();
        mainView.addSubview(indicatorView);
        
        let label = UILabel(frame: CGRectMake(10, 60, 60, 20));
        label.textAlignment = NSTextAlignment.Center;
        label.font = UIFont.systemFontOfSize(13);
        label.textColor = UIColor.whiteColor();
        mainView.addSubview(label);
        if (text == "" && text == nil) {
            label.text = "loading";
        } else {
            label.text = text;
        }
        
        window.windowLevel = UIWindowLevelAlert;
        window.center = rootview.center;
        window.hidden = false;
        window.addSubview(mainView);
        windows.append(window);
    }
    
    static func loadingNoticeWithText(text: String, type: LSLoadingNoticeType, dismiss: Bool) {
        let frame = CGRectMake(0, 0, 90, 90);
        let window = UIWindow(frame: frame);
        window.backgroundColor = UIColor.clearColor();
        let mainView = UIView(frame: frame);
        mainView.layer.cornerRadius = 10;
        mainView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7);
        
        var image = UIImage();
        switch type {
        case .Success:
            image = LSNoticeTypeInfo.imageOfCheckMark;
        case .Error:
            image = LSNoticeTypeInfo.imageOfErrorCross;
        case .Info:
            image = LSNoticeTypeInfo.imageOfInfo;
        }
        
        let typeMarkView = UIImageView(image: image);
        typeMarkView.frame = CGRectMake(27, 15, 36, 36);
        mainView.addSubview(typeMarkView);
        
        let label = UILabel(frame: CGRectMake(0, 60, 90, 16));
        label.font = UIFont.systemFontOfSize(13);
        label.text = text;
        label.textAlignment = NSTextAlignment.Center;
        label.textColor = UIColor.whiteColor();
        mainView.addSubview(label);
        
        window.windowLevel = UIWindowLevelAlert;
        window.center = rootview.center;
        window.hidden = false;
        window.addSubview(mainView);
        windows.append(window);
        
        if (dismiss) {
            let selector = Selector("hideNotice:");
            self.performSelector(selector, withObject: mainView, afterDelay: 3);
        }
    }
    
    static func hideNotice(sender: AnyObject) {
        if sender is UIView {
            sender.removeFromSuperview();
        }
    }
}

//绘制标记图片
class LSNoticeTypeInfo {//显示的提醒类型标记
    struct Cache {
        static var imageOfCheckMark: UIImage?
        static var imageOfErrorCross: UIImage?
        static var imageOfInfo: UIImage?
    }
    class func drawNoticeMarkWithType(type: LSLoadingNoticeType) {
        let noticeMarkPath = UIBezierPath();
        
        // draw circle
        noticeMarkPath.moveToPoint(CGPointMake(36, 18));
        noticeMarkPath.addArcWithCenter(CGPointMake(18, 18), radius: 17.5, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true);
        noticeMarkPath.closePath();
        
        switch type {
        case .Success: //draw checkMark
            noticeMarkPath.moveToPoint(CGPointMake(10, 18));
            noticeMarkPath.addLineToPoint(CGPointMake(16, 24));
            noticeMarkPath.addLineToPoint(CGPointMake(27, 13));
            noticeMarkPath.moveToPoint(CGPointMake(10, 18));
            noticeMarkPath.closePath();
        case .Error:   //draw Error
            noticeMarkPath.moveToPoint(CGPointMake(10, 10));
            noticeMarkPath.addLineToPoint(CGPointMake(26, 26));
            noticeMarkPath.moveToPoint(CGPointMake(10, 26));
            noticeMarkPath.addLineToPoint(CGPointMake(26, 10));
            noticeMarkPath.moveToPoint(CGPointMake(10, 10));
            noticeMarkPath.closePath();
        case .Info:    //draw Info
            noticeMarkPath.moveToPoint(CGPointMake(18, 6));
            noticeMarkPath.addLineToPoint(CGPointMake(18, 22));
            noticeMarkPath.moveToPoint(CGPointMake(18, 6));
            noticeMarkPath.closePath();
            
            UIColor.whiteColor().setStroke();
            noticeMarkPath.stroke();
            let noticeMarkPath = UIBezierPath();
            noticeMarkPath.moveToPoint(CGPointMake(18, 27));
            noticeMarkPath.addArcWithCenter(CGPointMake(18, 27), radius: 1, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true);
            noticeMarkPath.closePath();
            
            UIColor.whiteColor().setStroke();
            noticeMarkPath.fill();
        }
        UIColor.whiteColor().setStroke();
        noticeMarkPath.stroke();
    }
    
    class var imageOfCheckMark: UIImage {
        if (Cache.imageOfCheckMark != nil) {
            return Cache.imageOfCheckMark!;
        }
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), false, 0);
        LSNoticeTypeInfo.drawNoticeMarkWithType(LSLoadingNoticeType.Success);
        Cache.imageOfCheckMark = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return Cache.imageOfCheckMark!;
    }
    
    class var imageOfErrorCross: UIImage {
        if (Cache.imageOfErrorCross != nil) {
            return Cache.imageOfErrorCross!;
        }
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), false, 0);
        LSNoticeTypeInfo.drawNoticeMarkWithType(LSLoadingNoticeType.Error);
        Cache.imageOfErrorCross = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return Cache.imageOfErrorCross!;
    }
    
    class var imageOfInfo: UIImage {
        if (Cache.imageOfInfo != nil) {
            return Cache.imageOfInfo!
        }
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), false, 0);
        LSNoticeTypeInfo.drawNoticeMarkWithType(LSLoadingNoticeType.Info);
        Cache.imageOfInfo = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return Cache.imageOfInfo!;
    }
}

