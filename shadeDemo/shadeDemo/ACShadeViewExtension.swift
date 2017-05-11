//
//  ACShadeViewExtension.swift
//  ACShadeView
//
//  Created by ancheng on 16/10/9.
//  Copyright © 2016年 ac. All rights reserved.
//

import UIKit

extension UIView {

  // 渐变的方向
  public enum ACShadeDirection: String {
    case topToBottom = "0001"
    case leftToRight = "0010"
    case bottomToTop = "0100"
    case rightToLeft = "1000"

    case leftTopToRightBottom = "0011"
    case rightTopToLeftBottom = "1001"
    case leftBottomToRightTop = "0110"
    case rightBottomToLeftTop = "1100"
  }
  
  /// 根据一个颜色的透明度渐变,默认方向从上到下
  ///
  /// - parameter color:     渐变的颜色
  /// - parameter fromAlpha: 从什么透明度开始
  /// - parameter toAlpha:   到什么透明度结束
  /// - parameter direction: 渐变的方向
  public func ac_shadeView(withColor color: UIColor, fromAlpha: CGFloat = 0, toAlpha: CGFloat = 1, direction: ACShadeDirection = .topToBottom) {
    var fromAlpha = fromAlpha
    fromAlpha = max(0, fromAlpha)
    var toAlpha = toAlpha
    toAlpha = min(1, toAlpha)
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [color.withAlphaComponent(fromAlpha).cgColor,color.withAlphaComponent(toAlpha).cgColor]
    self.layoutIfNeeded()
    gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    ac_startAndEndPoint(gradientLayer, direction: direction)
    self.layer.addSublayer(gradientLayer)
  }
  
  /// 根据一个16进制颜色的透明度渐变,默认方向从上到下
  ///
  /// - parameter RGBcolor:  6位或者8位的16进制颜色字符串
  /// - parameter fromAlpha: 从什么透明度开始
  /// - parameter ToAlpha:   到什么透明度结束
  /// - parameter direction: 渐变的方向
  public func ac_shadeView(WithRGBcolor color: String, fromAlpha: CGFloat = 0, toAlpha: CGFloat = 1, direction: ACShadeDirection = .topToBottom) {
    ac_shadeView(withColor: ac_hexStringToColor(color), fromAlpha: fromAlpha, toAlpha: toAlpha, direction: direction)
  }
  
  /// 多个颜色的渐变，默认方向从上到下
  ///
  /// - parameter colorList: 颜色的数组
  /// - parameter direction: 渐变的方向
  public func ac_shadeView(withColorList colorList: [UIColor], direction: ACShadeDirection = .topToBottom) {
    let gradientLayer = CAGradientLayer()
    let list = colorList.map({$0.cgColor})
    gradientLayer.colors = list
    self.layoutIfNeeded()
    gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    ac_startAndEndPoint(gradientLayer, direction: direction)
    self.layer.addSublayer(gradientLayer)
  }
  
  
  /// 多个16进制字符串颜色的渐变，默认方向从上到下
  ///
  /// - parameter colorList: 16进制字符串颜色的数组
  /// - parameter direction: 渐变的方向
  public func ac_shadeView(withRGBcolorList RGBcolorList: [String], direction: ACShadeDirection = .topToBottom) {
    ac_shadeView(withColorList: RGBcolorList.map({ ac_hexStringToColor($0) }), direction: direction)
  }
  
  // 根据方向计算起点与终点
  private func ac_startAndEndPoint(_ gradientLayer: CAGradientLayer,direction: ACShadeDirection){
    let str = direction.rawValue
    gradientLayer.startPoint = CGPoint(x: Int(str[str.index(str.startIndex, offsetBy: 0)..<str.index(str.endIndex, offsetBy: -3)]) ?? 0, y: Int(str[str.index(str.startIndex, offsetBy: 1)..<str.index(str.endIndex, offsetBy: -2)]) ?? 0)
    gradientLayer.endPoint = CGPoint(x: Int(str[str.index(str.startIndex, offsetBy: 2)..<str.index(str.endIndex, offsetBy: -1)]) ?? 0, y: Int(str[str.index(str.endIndex, offsetBy: -1)..<str.index(str.endIndex, offsetBy: 0)]) ?? 0)
  }
  
  
  
  // 通过16进制字符串得到颜色
  private func ac_hexStringToColor(_ stringToConvert : String, alpha: CGFloat = 1) -> UIColor{
    var cString : String = stringToConvert.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    // String should be 6 or 8 characters
    
    if cString.characters.count < 6 {
      return UIColor.black
    }
    
    if cString.hasPrefix("0X"){
      cString = NSString(string: cString).substring(from: 2)
    }
    if cString.hasPrefix("#"){
      cString = NSString(string: cString).substring(from: 1)
    }
    if cString.characters.count != 6{
      return UIColor.black
    }
    // Separate into r, g, b substrings
    var range  = NSRange(location: 0,length: 2)
    let rString = NSString(string: cString).substring(with: range)
    range.location = 2
    let gString = NSString(string: cString).substring(with: range)
    range.location = 4
    let bString = NSString(string: cString).substring(with: range)
    
    // Scan values
    var r, g, b : UInt32?
    r = 0
    g = 0
    b = 0
    Scanner(string: rString).scanHexInt32(&r!)
    Scanner(string: gString).scanHexInt32(&g!)
    Scanner(string: bString).scanHexInt32(&b!)
    
    return UIColor(red: (CGFloat(r!))/255.0, green: (CGFloat(g!))/255.0, blue: (CGFloat(b!))/255.0, alpha: alpha)
  }
}
