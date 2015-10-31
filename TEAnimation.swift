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
        animation.toValue = opacity
        animation.duration = duration
        return animation
    }
}