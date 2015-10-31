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
    let shimmeringHighlightLength:CGFloat = 1.0;
    let shimmeringAnimationOpacity:CGFloat = 0.5
    let shimmeringOpacity:CGFloat = 1.0
    let shimmetingDirection = TEShimmeringDirection.Right
    
    var contentLayer: CALayer? {
        didSet {
            self.updateShimmering()
        }
    }
    
    var shimmeringSpeed:CGFloat = 50.0 {
        didSet {
            self.updateShimmering()
        }
    }
    
    private func updateShimmering() {
        self.createMuskLayerIfNeeded()
        [self .layoutIfNeeded()]
        let length = CGRectGetWidth(self.contentLayer!.bounds)
        let animateDuration = (length / self.shimmeringSpeed) + self.shimmeringPauseDuration
        let slideAnimation = TEAnimation.slideAnimation(CFTimeInterval(animateDuration), direction: self.shimmetingDirection)
        slideAnimation.removedOnCompletion  = false
        slideAnimation.beginTime = CACurrentMediaTime()
        self.maskLayer!.addAnimation(slideAnimation, forKey: "slide")
    }
    
    private func createMuskLayerIfNeeded() {
        if self.maskLayer != nil { return }
        self.maskLayer = TEShimmeringMaskLayer()
        self.contentLayer?.mask = self.maskLayer
//        self.updateMaskColors()
        self.updateMaskLayout()
        
    }
    
    private func updateMaskColors() {
        if self.maskLayer == nil { return }
        let maskedColor = UIColor(white: 1.0, alpha: self.shimmeringOpacity)
        let unmaskedColor = UIColor(white: 1.0, alpha: self.shimmeringAnimationOpacity)
        self.maskLayer?.colors = [maskedColor.CGColor, unmaskedColor.CGColor, maskedColor.CGColor]
    }
    
    private func updateMaskLayout() {
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
        self.maskLayer?.bounds = CGRectMake(0, 0, fullShimmerLength, CGFloat(80)) //TODO heightのhard codeを修正する。
//        self.maskLayer?.bounds = CGRectMake(0, 0, fullShimmerLength, CGRectGetHeight((self.contentLayer?.bounds)!))
    }
}
