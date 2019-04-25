//
//  MDTagView.swift
//  MDTagViewDemo
//
//  Created by  MarvinChan on 2019/4/24.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class MDDotView: UIView {
    
    /// 中心小圆点
    lazy var centerView: UIView = {
        let centerView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        centerView.backgroundColor = UIColor.white
        centerView.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        centerView.layer.cornerRadius = 2
        centerView.layer.masksToBounds = true
        return centerView
    }()
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        if newSuperview != nil {
            startTagAnimation()
        }
    }
    
    var isLoading = false {
        didSet {
            if isLoading {
                stopTagAnimation()
                startTagAnimation()
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func startTagAnimation() {
        setupUI()
    }
    
    
    func setupUI() {
        self.layer.removeAllAnimations()
        
        let shapeLayer          = CAShapeLayer()
        shapeLayer.frame        = self.bounds
        shapeLayer.path         = UIBezierPath(ovalIn: shapeLayer.bounds).cgPath
        shapeLayer.fillColor    = UIColor.black.cgColor
        shapeLayer.opacity      = 0
        
        let opacityAnimation        = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue  = 0.5
        opacityAnimation.toValue    = 0
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = shapeLayer.bounds
        replicatorLayer.instanceCount = 2
        replicatorLayer.instanceDelay = 1
        replicatorLayer.addSublayer(shapeLayer)
        self.layer.addSublayer(replicatorLayer)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform")
        scaleAnimation.fromValue = NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity,0.18,0.18, 0))
        scaleAnimation.toValue   = NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity,1, 1, 0))
        
        let groupAnimation          = CAAnimationGroup()
        groupAnimation.animations   = [opacityAnimation,scaleAnimation]
        groupAnimation.duration     = 2
        groupAnimation.repeatCount  = HUGE
        groupAnimation.autoreverses = false
        shapeLayer.add(groupAnimation, forKey: "groupAnimation")
        
        self.addSubview(centerView)
    }
    
    
    func stopTagAnimation() {
        centerView.removeFromSuperview()
        self.layer.removeAllAnimations()
    }
}
