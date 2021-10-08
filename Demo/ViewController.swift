//
//  ViewController.swift
//  Demo
//
//  Created by Le vinh Sang on 10/7/21.
//

import UIKit

class ViewController: UIViewController {

    var shapeLayout = CAShapeLayer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let circulapath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle:  .pi / 2, endAngle:  .pi / 2 +  2 * .pi, clockwise: true)
        let circulapath = UIBezierPath()
        circulapath.move(to: CGPoint(x: 50, y: 100))
        circulapath.addLine(to: CGPoint(x: 200, y:100))

        shapeLayout.path = circulapath.cgPath
        shapeLayout.strokeColor = UIColor.red.cgColor
        shapeLayout.lineWidth = 4
        shapeLayout.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayout)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleStartAnimated)))
    }
    
    @objc private func handleStartAnimated() {
        print("animated")
        let basicAnimated = CABasicAnimation(keyPath: "strokeEnd");
        basicAnimated.toValue = 1;
        basicAnimated.duration = 0.3
        basicAnimated.fillMode = CAMediaTimingFillMode.forwards
        basicAnimated.isRemovedOnCompletion = false
        
        shapeLayout.add(basicAnimated, forKey: "urSobasic")
    }

}

