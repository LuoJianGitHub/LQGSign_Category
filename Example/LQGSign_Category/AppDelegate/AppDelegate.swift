//
//  AppDelegate.swift
//  LQGSign_Category
//
//  Created by 罗建 on 04/29/2022.
//  Copyright (c) 2022 罗建. All rights reserved.
//

import UIKit
import LQGBaseAppDelegate
import LQGBaseView
import LQGCTMediator

typealias BlockType = @convention(block) ([AnyHashable: Any]?) -> Void

@UIApplicationMain
class AppDelegate: LQGBaseAppDelegate {

    override init() {
        super.init()
        
        self.needShowSignVCBlock = {
            return true
        }
        
        self.getSignVCBlock = {
            let vc = CT().performTarget("Sign", action: "getRootVC", params: [
                kCTMediatorParamsKeySwiftTargetModuleName: "LQGSign_Category",
                "signInSuccessCompletion": {
                    let block: BlockType = { userInfo in
                        print("\(userInfo!)")
                    }
                    return unsafeBitCast(block as BlockType, to: AnyObject.self)
                }()
            ], shouldCacheTarget: false) as? UIViewController
            if vc == nil {
                return nil
            }
            return LQGBaseNavigationController.init(rootViewController: vc!)
        }
    }
    
}
