//
//  TEAnimation.swift
//  TEShimmering
//
//  Created by teppeieda on 10/31/15.
//  Copyright © 2015 teppeieda. All rights reserved.
//

import Foundation
import QuartzCore

final class TEAnimation {
    //MARK: こっちはまだ使っていない==============
    static func fadeAnimation(layer: CALayer, opacity: CGFloat, duration: CFTimeInterval) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = layer.presentationLayer()?.opacity
        animation.toValue = opacity
        animation.duration = duration
        return animation
    }
    //======================================
    
    static func slideAnimation(duration:CFTimeInterval, direction: TEShimmeringDirection) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = NSValue(CGPoint: CGPointZero)
        animation.duration = duration
        animation.repeatCount = .infinity
        return animation
    }
}