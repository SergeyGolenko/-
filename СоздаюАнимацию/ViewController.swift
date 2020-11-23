//
//  ViewController.swift
//  СоздаюАнимацию
//
//  Created by Сергей Голенко on 23.11.2020.
//  Copyright © 2020 Сергей Голенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var figureOne: CAShapeLayer!
    var figureTwo: CAShapeLayer!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createShapes()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
            self.view.addGestureRecognizer(gesture)
    }
    
   @objc func tapped(_ sender:UITapGestureRecognizer){
    let pathAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
    pathAnimation.fromValue = figureOne.path
    figureOne.path = figureTwo.path
    pathAnimation.toValue = figureTwo.path
    pathAnimation.duration = 3

    figureOne.add(pathAnimation,forKey: nil)
    
    let fillColorAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.fillColor))
    fillColorAnimation.fromValue = figureOne.fillColor
    figureOne.fillColor = figureTwo.fillColor
    fillColorAnimation.duration = 0.5
    fillColorAnimation.toValue = figureTwo.fillColor
    figureOne.add(fillColorAnimation, forKey: nil)
    
    let rotationAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.transform))
    rotationAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
    rotationAnimation.fromValue = 0
    rotationAnimation.toValue = 4 * Float.pi
    rotationAnimation.duration = 3
    figureOne.add(rotationAnimation, forKey: nil)
    
    }
    
    func createShapes(){
        
        figureOne = CAShapeLayer()
        let rect = CGRect(x: self.view.frame.width / 2 - 75, y: self.view.frame.height / 2 - 75, width: 150, height: 150)
        figureOne.path = UIBezierPath(roundedRect: rect, cornerRadius: 0).cgPath
        figureOne.fillColor = UIColor.red.cgColor
        figureOne.frame = self.view.bounds
        view.layer.addSublayer(figureOne)
        
        
        figureTwo = CAShapeLayer()
              let rectForFigureTwo = CGRect(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2 - 50, width: 100, height: 100)
        
        
        figureTwo.path = UIBezierPath(ovalIn: rectForFigureTwo).cgPath
              figureTwo.fillColor = UIColor.green.cgColor
              //view.layer.addSublayer(figureTwo)
    }


}

