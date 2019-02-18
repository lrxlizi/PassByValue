//
//  ViewController.swift
//  PassByValueDemo
//
//  Created by 栗子 on 2019/2/18.
//  Copyright © 2019年 http://www.cnblogs.com/Lrx-lizi/    https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748. All rights reserved.
//

import UIKit

import SnapKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,passByValueDelegate {
    
    let tableView           = UITableView()
    var dataSource:NSArray  = []
    let label               = UILabel()
    let delgateLB           = UILabel()
    let notiLB              = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //接收通知
        let noti = NSNotification.Name(rawValue: "MYNOTI")
        NotificationCenter.default.addObserver(self, selector: #selector(getNoti(notif:)), name: noti, object: nil)
        
        dataSource = ["block","delegate","Notification"]
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        self.view.addSubview(label)
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(300)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(delgateLB)
        delgateLB.backgroundColor = UIColor.red
        delgateLB.textColor = UIColor.white
        delgateLB.font = UIFont.systemFont(ofSize: 15)
        delgateLB.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(label.snp.bottom).offset(30)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(notiLB)
        notiLB.backgroundColor = UIColor.red
        notiLB.textColor = UIColor.white
        notiLB.font = UIFont.systemFont(ofSize: 15)
        notiLB.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(delgateLB.snp.bottom).offset(30)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "IDCELL")
        if(!(cell != nil)){
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "IDCELL")
        }
        cell?.textLabel?.text = (dataSource[indexPath.row] as! String)
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = BlockNotiDelegateDetailVC()
        detail.delegate = self
        detail.getPassByValueBlock { (value) in
            self.label.text = value
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }
    // passByValueDelegate
    func didDeleteText(text: String) {
        print("delegate===",text)
        delgateLB.text = text
    }
    
    //通知
    @objc func getNoti(notif:NSNotification){
        guard let text : String = notif.object as! String? else{ return }
        self.notiLB.text = text
    }
    
    
}

