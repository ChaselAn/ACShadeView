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
    alphaView1.shadeViewWithAlpha(color: UIColor.black)
    let twoColorView1 = UIView(frame: CGRect(x: 140, y: 20, width: 100, height: 100))
    view.addSubview(twoColorView1)
    twoColorView1.shadeViewWithTwoColor(startColor: UIColor.red, endColor: UIColor.blue)
    let colorListView1 = UIView(frame: CGRect(x: 260, y: 20, width: 100, height: 100))
    view.addSubview(colorListView1)
    colorListView1.shadeViewWithColorList(colorList: [UIColor.red,UIColor.blue,UIColor.green])
    
    let alphaView2 = UIView(frame: CGRect(x: 20, y: 140, width: 100, height: 100))
    view.addSubview(alphaView2)
    alphaView2.shadeViewWithAlpha(color: UIColor.black,direction: .LeftToRight)
    let twoColorView2 = UIView(frame: CGRect(x: 140, y: 140, width: 100, height: 100))
    view.addSubview(twoColorView2)
    twoColorView2.shadeViewWithTwoColor(startColor: UIColor.red, endColor: UIColor.blue,direction: .LeftToRight)
    let colorListView2 = UIView(frame: CGRect(x: 260, y: 140, width: 100, height: 100))
    view.addSubview(colorListView2)
    colorListView2.shadeViewWithColorList(colorList: [UIColor.red,UIColor.blue,UIColor.green],direction: .LeftToRight)
    
    let alphaView3 = UIView(frame: CGRect(x: 20, y: 260, width: 100, height: 100))
    view.addSubview(alphaView3)
    alphaView3.shadeViewWithAlpha(color: UIColor.black,direction: .LeftTopToRightBottom)
    let twoColorView3 = UIView(frame: CGRect(x: 140, y: 260, width: 100, height: 100))
    view.addSubview(twoColorView3)
    twoColorView3.shadeViewWithTwoColor(startColor: UIColor.red, endColor: UIColor.blue,direction: .LeftTopToRightBottom)
    let colorListView3 = UIView(frame: CGRect(x: 260, y: 260, width: 100, height: 100))
    view.addSubview(colorListView3)
    colorListView3.shadeViewWithColorList(colorList: [UIColor.red,UIColor.blue,UIColor.green],direction: .LeftTopToRightBottom)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

