//
//  ViewController.swift
//  caoqinyu_13
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 2016110302. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var label:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor=UIColor.white
        //定义按钮
        let btn=UIButton(frame: CGRect(x: 100, y: 50, width: 100, height: 40))
        btn.setTitle("start", for: .normal)
        btn.layer.borderWidth=1
        btn.setTitleColor(UIColor.black, for: .normal)
        //btn.setTitleColor(UIColor.brown, for: .highlighted)
        btn.addTarget(self, action: #selector(startcul), for: .touchUpInside)
        self.view.addSubview(btn)
        //定义label
        label=UILabel(frame: CGRect(x: 75, y: 100, width: 200, height: 40))
        //默认显示值
        label.text="sum=0"
        label.textAlignment = .center
        label.layer.borderWidth=1
        label.textColor=UIColor.black
        self.view.addSubview(label)
    }
    @objc func startcul(){
        DispatchQueue.global().async {
            var sum=0
            for num in 1...9999999{
                sum+=num
                //ui操作必须在主线程
                DispatchQueue.main.async {
                    self.label.text="sum=\(sum)"
                }
            }
        }
    }

}

