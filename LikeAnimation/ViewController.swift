//
//  ViewController.swift
//  LikeAnimation
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let colorView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .yellow
    //        view.clipsToBounds = true
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //        view.addSubview(colorView)
    //        colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    //        colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    //        colorView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    //        colorView.topAnchor.constraint(equalTo: view.topAnchor, constant: -50).isActive = true
    let gesture = UITapGestureRecognizer(target: self, action: #selector(like))
    view.addGestureRecognizer(gesture)
  }
  
  @objc func like() {
    //        let demension = 20 + drand48() * 10
    let duration = 2 + drand48() * 1
    let likeIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    likeIcon.image = #imageLiteral(resourceName: "heart")
    let animation = CAKeyframeAnimation(keyPath: "position")
    animation.path = customPath().cgPath
    animation.duration = duration
    animation.fillMode = CAMediaTimingFillMode.forwards
    animation.isRemovedOnCompletion = false
    //        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    likeIcon.layer.add(animation, forKey: nil)
    //        UIView.animate(withDuration: duration) {
    //            likeIcon.alpha = 0
    //        }
    //
    view.addSubview(likeIcon)
  }
  
  func customPath() -> UIBezierPath {
    let rect = view.frame
    let path = UIBezierPath()
    path.move(to: CGPoint(x: -30, y: 250))
    let endPoint = CGPoint(x: rect.width + 30, y: 200)
    let randomY = 200 + drand48() * 300
    let cp1 = CGPoint(x: 100, y: 100 - randomY)
    let cp2 = CGPoint(x: 200, y: 300 + randomY)
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    return path
  }
  
}

