//
//  ImageController.swift
//  Arte
//
//  Created by Veronica on 3/22/16.
//  Copyright © 2016 JustVCreative. All rights reserved.
//

import UIKit

class ImageController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate  {

    var pageViewController: UIPageViewController!
    let images = ["ImageOne", "ImageTwo", "ImageThree"]
    
    // Mark: Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let index = images.indexOf(viewController.restorationIdentifier!) {
            if index > 0 {
                return viewControllerAtIndex(index - 1)
            }
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let  index = images.indexOf(viewController.restorationIdentifier!) {
            if index < images.count - 1 {
                return viewControllerAtIndex(index + 1)
            }
        }
        return nil
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController? {
        let vc = storyboard?.instantiateViewControllerWithIdentifier(images[index])
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let vc = storyboard?.instantiateViewControllerWithIdentifier("MyPageViewController") {
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            
            pageViewController = vc as! UIPageViewController
            pageViewController.dataSource = self
            pageViewController.delegate = self
            
            pageViewController.setViewControllers([viewControllerAtIndex(0)!], direction: .Forward, animated: true, completion: nil)
            pageViewController.didMoveToParentViewController(self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
