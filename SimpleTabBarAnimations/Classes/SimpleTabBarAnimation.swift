//
//  SimpleTabBarAnimation.swift
//  SimpleTabBarAnimations
//
//  Created by Aleksandar Geyman on 28.04.20.
//
//  MIT License
//  Copyright © 2020 Aleksandar Geyman
//
/*  Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

/// Available animations for UITabBarItems
public enum TabBarItemAnimation {
    case scale
    // TODO: Implement more animations
}

public protocol SimpleTabBarAnimation: UITabBarController {
    /// Animates UITabBarItem Image View with custom animation.
    ///
    /// Example implementation
    ///
    ///     override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    ///         playAnimation(type: .scale, for: item)
    ///     }
    ///
    /// - Parameters:
    ///   - type: Desired animation provided from TabBarItemAnimation.
    ///   - item: UITabBarItem to be animated.
    func playAnimation(type: TabBarItemAnimation, for item: UITabBarItem)
}

/// Implementation of SimpleTabBarAnimation
public extension SimpleTabBarAnimation {
    func playAnimation(type: TabBarItemAnimation, for item: UITabBarItem) {
        let barItemIndex = tabBar.items?.firstIndex(of: item) ?? 0
        let subviewIndex = barItemIndex + 1
        guard subviewIndex < tabBar.subviews.count,
            let imageView = tabBar.subviews[subviewIndex].subviews.first as? UIImageView else { return }
        
        switch type {
        case .scale:
            scaleAnimation(for: imageView)
        }
    }
    
    private func scaleAnimation(for item: UIImageView) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.5)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        
        item.layer.add(bounceAnimation, forKey: nil)
    }
}
