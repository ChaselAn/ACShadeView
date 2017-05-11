# ACShadeView

* Swift3.x
* UIView的拓展，可以将UIView的颜色变成一种或多种颜色的渐变效果，效果如图所示。

![](http://7xte1z.com1.z0.glb.clouddn.com/ACShadeView.png)

* 支持8个方向的渐变
* 支持一种颜色根据透明度渐变（图中第一列）
* 支持多种颜色的渐变（图中第二三列）

## 使用方法
* 将文件中的ACShadeViewExtension.swift拖到项目中，使用UIView的对象进行调用

```swift
let myView = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
myView.ac_shadeView(withColor: UIColor.black)
myView.ac_shadeView(withColorList: [UIColor.red, UIColor.blue])
view.addSubview(myView)
```
