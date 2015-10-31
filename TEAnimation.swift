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
    static func fadeAnimation(layer: CALayer, opacity: CGFloat, duration: CFTimeInterval) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = layer.presentationLayer()?.opacity
//        animation.fromValue = 1
        animation.toValue = opacity
        animation.duration = duration
        return animation
    }
    
    static func slideAnimation(duration:CFTimeInterval, direction: TEShimmeringDirection) {
        
    }
}