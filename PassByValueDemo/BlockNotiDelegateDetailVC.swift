//
//  BlockNotiDelegateDetailVC.swift
//  SnakitDemo
//
//  Created by 栗子 on 2019/2/17.
//  Copyright © 2019年 http://www.cnblogs.com/Lrx-lizi/    https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748. All rights reserved.
//

import UIKit

protocol passByValueDelegate {
    func didDeleteText(text:String)
}

class BlockNotiDelegateDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.backgroundColor = UIColor.purple
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(30)
            make.width.equalTo(150)
            make.height.equalTo(70)
        }
        btn.addTarget(self, action: #selector(btnAction), for: UIControl.Event.touchUpInside)
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.setTitle("Block", for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        
        let btn1 = UIButton()
        self.view.addSubview(btn1)
        btn1.backgroundColor = UIColor.red
        btn1.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(30)
            make.left.equalTo(30)
            make.width.equalTo(150)
            make.height.equalTo(70)
        }
        btn1.addTarget(self, action: #selector(btn1Action), for: UIControl.Event.touchUpInside)
        btn1.layer.cornerRadius = 20
        btn1.layer.masksToBounds = true
        btn1.setTitle("delegate", for: UIControl.State.normal)
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn1.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        
        
        let btn2 = UIButton()
        self.view.addSubview(btn2)
        btn2.backgroundColor = UIColor.red
        btn2.snp.makeConstraints { (make) in
            make.top.equalTo(btn1.snp.bottom).offset(30)
            make.left.equalTo(30)
            make.width.equalTo(150)
            make.height.equalTo(70)
        }
        btn2.addTarget(self, action: #selector(btn2Action), for: UIControl.Event.touchUpInside)
        btn2.layer.cornerRadius = 20
        btn2.layer.masksToBounds = true
        btn2.setTitle("noti", for: UIControl.State.normal)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn2.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
    }
/**********************Block******************************************/
    typealias passByValueBlock = (String) ->()
    var pbvBlock :passByValueBlock?
    func getPassByValueBlock(block :passByValueBlock?){
            pbvBlock = block
    }
    //按钮点击事件
    @objc func btnAction(){
        if let block = self.pbvBlock{
            block("block传参")
        }
        self.navigationController?.popViewController(animated: true)
    }
/***********************Block*****************************************/
    
/************************delegate****************************************/
    var delegate : passByValueDelegate?
    //按钮点击事件
    @objc func btn1Action(){
        delegate?.didDeleteText(text: "delegate传值")
        self.navigationController?.popViewController(animated: true)
    }
    
/************************delegate****************************************/

/************************noti****************************************/
    let NotiName = NSNotification.Name(rawValue: "MYNOTI")
    //按钮点击事件
    @objc func btn2Action(){
       NotificationCenter.default.post(name: NotiName, object: "通知传值")
       self.navigationController?.popViewController(animated: true)

    }
    
    
}

/*
 typealias textBlock = (String) -> ()
 var block: textBlock?
 func getBlock(block: textBlock?) {
 self.block = block
 }
 
 if let block = self.block {
 block("按钮点击事件")
 }
 */
