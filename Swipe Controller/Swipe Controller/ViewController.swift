//
//  ViewController.swift
//  Swipe Controller
//
//  Created by Joacim Nidén on 03/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func innerScrollViewShouldScroll() -> Bool
}

class ViewController: UIViewController {
    
    var vC:NSMutableArray = [] //This where the viewcontrollers will end up and send it to the view
    
    //Put the viewcontroller identifiers here
    let viewControllersRaw:NSArray = [
        "right","left","middle"
    ]
    
    var initialContentOffset = CGPoint() // scrollView initial offset
    var scrollView: UIScrollView!
    var delegate: ViewControllerDelegate?
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for(var i=0;i<viewControllersRaw.count; i++){
            
            //This changes change the instantiate view
            
            let object = storyboard!.instantiateViewControllerWithIdentifier(viewControllersRaw[i] as! String)
            vC.addObject(object)
        }
        
        setupHorizontalScrollView()
    }
    
    func setupHorizontalScrollView() {
        
        //Set some standard vars
        let cWidth = CGRectGetWidth(self.view.bounds)
        let cHeight = CGRectGetHeight(self.view.bounds)
        let countVC = CGFloat(vC.count)
        
        scrollView = UIScrollView()
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.delegate = self
        
        //Set the size of the frame
        self.scrollView!.frame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, cWidth, cHeight)
        self.view.addSubview(scrollView)
        
        let scrollWidth: CGFloat  = countVC * cWidth
        let scrollHeight: CGFloat  = cHeight
        self.scrollView!.contentSize = CGSizeMake(scrollWidth, scrollHeight)
        
        //Loop through all views
        for var i=0;i<self.vC.count;i++ {
            
            //Set the frames
            vC[i].view!?.frame = CGRectMake(CGFloat(i) * cWidth, 0, cWidth, cHeight)
            self.addChildViewController(vC[i] as! UIViewController)
            self.scrollView!.addSubview(vC[i].view!!)
            
            if(i == self.vC.count){
                vC[i].didMoveToParentViewController(self)
            }
            
            
        }
        
        
        self.scrollView!.delegate = self;
    }
    
    
}

// MARK: UIScrollView Delegate

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.initialContentOffset = scrollView.contentOffset
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if delegate != nil && !delegate!.innerScrollViewShouldScroll() {
            // This is probably crazy movement: diagonal scrolling
            var newOffset = CGPoint()
            
            if (abs(scrollView.contentOffset.x) > abs(scrollView.contentOffset.y)) {
                newOffset = CGPointMake(self.initialContentOffset.x, self.initialContentOffset.y)
            } else {
                newOffset = CGPointMake(self.initialContentOffset.x, self.initialContentOffset.y)
            }
            
            // Setting the new offset to the scrollView makes it behave like a proper
            // directional lock, that allows you to scroll in only one direction at any given time
            self.scrollView!.setContentOffset(newOffset,animated:  false)
        }
    }
}

