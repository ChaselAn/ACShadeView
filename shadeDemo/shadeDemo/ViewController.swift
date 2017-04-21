//
//  ViewController.swift
//  shadeDemo
//
//  Created by ancheng on 16/10/10.
//  Copyright © 2016年 ac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let alphaView1 = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
    view.addSubview(alphaView1)
    alphaView1.ac_shadeView(withColor: UIColor.black)
    let twoColorView1 = UIView(frame: CGRect(x: 140, y: 20, width: 100, height: 100))
    view.addSubview(twoColorView1)
    twoColorView1.ac_shadeView(withStartColor: UIColor.red, endColor: UIColor.blue)
    let colorListView1 = UIView(frame: CGRect(x: 260, y: 20, width: 100, height: 100))
    view.addSubview(colorListView1)
    colorListView1.ac_shadeView(withColorList: [UIColor.red,UIColor.blue,UIColor.green])
    
    let alphaView2 = UIView(frame: CGRect(x: 20, y: 140, width: 100, height: 100))
    view.addSubview(alphaView2)
    alphaView2.ac_shadeView(withColor: UIColor.black, direction: .leftToRight)
    let twoColorView2 = UIView(frame: CGRect(x: 140, y: 140, width: 100, height: 100))
    view.addSubview(twoColorView2)
    twoColorView2.ac_shadeView(withStartColor: UIColor.red, endColor: UIColor.blue, direction: .leftToRight)
    let colorListView2 = UIView(frame: CGRect(x: 260, y: 140, width: 100, height: 100))
    view.addSubview(colorListView2)
    colorListView2.ac_shadeView(withColorList: [UIColor.red,UIColor.blue,UIColor.green], direction: .leftToRight)
    
    let alphaView3 = UIView(frame: CGRect(x: 20, y: 260, width: 100, height: 100))
    view.addSubview(alphaView3)
    alphaView3.ac_shadeView(withColor: UIColor.black, direction: .leftTopToRightBottom)
    let twoColorView3 = UIView(frame: CGRect(x: 140, y: 260, width: 100, height: 100))
    view.addSubview(twoColorView3)
    twoColorView3.ac_shadeView(withStartColor: UIColor.red, endColor: UIColor.blue, direction: .leftTopToRightBottom)
    let colorListView3 = UIView(frame: CGRect(x: 260, y: 260, width: 100, height: 100))
    view.addSubview(colorListView3)
    colorListView3.ac_shadeView(withColorList: [UIColor.red,UIColor.blue,UIColor.green], direction: .leftTopToRightBottom)
  }


}

