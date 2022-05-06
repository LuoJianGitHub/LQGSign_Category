//
//  Target_Sign.swift
//  LQGSign_Category
//
//  Created by 罗建
//  Copyright (c) 2022 罗建. All rights reserved.
//

import Foundation
import LQGSign

typealias BlockType = @convention(block) ([AnyHashable: Any]?) -> Void

@objcMembers public class Target_Sign: NSObject {
    
    public func Action_getRootVC(_ params: NSDictionary?) -> UIViewController {
        let vc = LQGSignInController.init()
        vc.signInSuccessCompletion = {
            let block = params?["signInSuccessCompletion"]
            if block == nil {
                return nil
            }
            return unsafeBitCast(UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque()), to: BlockType.self)
        }()
        return vc
    }
    
}
