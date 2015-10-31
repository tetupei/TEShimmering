//
//  TEShimmeringLayer.swift
//  TEShimmering
//
//  Created by teppeieda on 10/31/15.
//  Copyright © 2015 teppeieda. All rights reserved.
//

import UIKit

enum TEShimmeringDirection {
    case Right
    case Left
    case Up
    case Down
}

class TEShimmeringLayer: CALayer {
    var maskLayer: TEShimmeringMaskLayer?
    
    let shimmeringPauseDuration:CGFloat = 0.4
    let shimmeringSpeed:CGFloat = 230.0
    let shimmeringHighlightLength:CGFloat = 1.0;
    let shimmeringAnimationOpacity:CGFloat = 0.5
    let shimmeringOpacity:CGFloat = 1.0
    let shimmetingDirection = TEShimmeringDirection.Right
//    let shimmeringBeginFadeDuration = 0.1;
//    let shimmeringEndFadeDuration = 0.3;
    
//    var shouldshimmering = true //shimmering flag
    
    var contentLayer: CALayer? {
        didSet {
            //guard let _ = newValue else { return }
            //self.updateShimmering()
        }
    }
    
    func updateShimmering() {
        self.createMuskLayerIfNeeded()
        [self .layoutIfNeeded()]
        let fadeAnimation = TEAnimation.fadeAnimation((self.maskLayer?.fadeLayer)! , opacity: 0, duration: 1)
        self.contentLayer?.mask?.addAnimation(fadeAnimation, forKey: "fade")
        //self.maskLayer?.mask?.addAnimation(fadeAnimation, forKey: "fade")
        
    }
    
    func createMuskLayerIfNeeded() {
        if self.maskLayer != nil { return }
        self.maskLayer = TEShimmeringMaskLayer()
        self.maskLayer?.backgroundColor = UIColor.yellowColor().CGColor
        self.contentLayer?.mask = self.maskLayer
        self.updateMaskColors()
        self.updateMaskLayout()
        
    }
    
    func updateMaskColors() {
        if self.maskLayer == nil { return }
        
        let maskedColor = UIColor(white: 1.0, alpha: self.shimmeringOpacity)
        let unmaskedColor = UIColor(white: 1.0, alpha: self.shimmeringAnimationOpacity)
        self.maskLayer?.colors = [maskedColor.CGColor, unmaskedColor.CGColor, maskedColor.CGColor]
    }
    
    func updateMaskLayout() {
        //MARK: 方向によって、出し分ける
        let length: CGFloat =  CGRectGetWidth((self.contentLayer?.bounds)!)
        let extraDistance = length + self.shimmeringSpeed + self.shimmeringPauseDuration
        let fullShimmerLength = length * 3.0 + extraDistance
        let travelDistance = length * 2.0 + extraDistance
        let highlightOutsideLength = (1.0 - self.shimmeringHighlightLength) / 2.0;
        self.maskLayer?.locations = [highlightOutsideLength, 0.5, 1.0 - highlightOutsideLength]
        let startPoint = (length * extraDistance) / fullShimmerLength
        let endPoint = travelDistance / fullShimmerLength
        
        self.maskLayer?.startPoint = CGPointMake(startPoint, 0)
        self.maskLayer?.endPoint = CGPointMake(endPoint, 0)
        self.maskLayer?.position = CGPointMake(-travelDistance, 0)
        self.maskLayer?.bounds = CGRectMake(0, 0, fullShimmerLength, CGRectGetHeight((self.contentLayer?.bounds)!))
    }
}
