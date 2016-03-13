//
//  composeTweet.swift
//  Arte
//
//  Created by Veronica on 3/13/16.
//  Copyright © 2016 JustVCreative. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

class Composer {
    let composer = TWTRComposer()
    let text: String = "Loved the new designs by @Th3ba1r0n"
    
    composer.setText(text: String)
    composer.setImage(UIImage(named: "Th3ba1r0n"))
    
    // Called from a UIViewController
    composer.showFromViewController(self) { result in
    if (result == TWTRComposerResult.Cancelled) {
        println("Tweet composition cancelled")
    }
    else {
        println("Sending tweet!")
        }
    }
}