//
//  Timeline.swift
//  Arte
//
//  Created by Veronica on 3/19/16.
//  Copyright © 2016 JustVCreative. All rights reserved.
//

import UIKit
import TwitterKit

let red = UIColor(red: 173/255.0, green: 34/255.0, blue: 34/255.0, alpha: 1.0)

class TimelineController: TWTRTimelineViewController {
    let appearance = TWTRTweetView.appearance()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "Th3ba1r0n", APIClient: client)
        
        appearance.primaryTextColor = red
    }
}