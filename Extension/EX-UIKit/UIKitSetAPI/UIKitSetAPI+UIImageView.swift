//
//  UIKitSetAPI+UIImageView.swift
//  EXDemo
//
//  Created by zhiyong yin on 2021/5/23.
//

import UIKit


public extension UIImageView {
    
    // default is nil
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    @available(iOS 3.0, *)
    // default is nil
    @discardableResult
    func highlightedImage(_ highlightedImage: UIImage?) -> Self {
        self.highlightedImage = highlightedImage
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func preferredSymbolConfiguration(_ preferredSymbolConfiguration: UIImage.SymbolConfiguration?) -> Self {
        self.preferredSymbolConfiguration = preferredSymbolConfiguration
        return self
    }
    
    /*
    // default is NO
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }*/
    
    @available(iOS 3.0, *)
    // default is NO
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    
    // these allow a set of images to be animated. the array may contain multiple copies of the same
    // The array must contain UIImages. Setting hides the single image. default is nil
    @discardableResult
    func animationImages(_ animationImages: [UIImage]?) -> Self {
        self.animationImages = animationImages
        return self
    }
    
    @available(iOS 3.0, *)
    // The array must contain UIImages. Setting hides the single image. default is nil
    @discardableResult
    func highlightedAnimationImages(_ highlightedAnimationImages: [UIImage]?) -> Self {
        self.highlightedAnimationImages = highlightedAnimationImages
        return self
    }
    

    
    // for one cycle of images. default is number of images * 1/30th of a second (i.e. 30 fps)
    @discardableResult
    func animationDuration(_ animationDuration: TimeInterval) -> Self {
        self.animationDuration = animationDuration
        return self
    }

    // 0 means infinite (default is 0)
    @discardableResult
    func animationRepeatCount(_ animationRepeatCount: Int) -> Self {
        self.animationRepeatCount = animationRepeatCount
        return self
    }

    /*
    // When tintColor is non-nil, any template images set on the image view will be colorized with that color.
    // The tintColor is inherited through the superview hierarchy. See UIView for more information.
    @available(iOS 7.0, *)
    @discardableResult
    func tintColor(_ tintColor: UIColor!) -> Self {
        self.tintColor = tintColor
        return self
    }*/
}
