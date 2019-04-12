//
//  AppViewController.swift
//  Project_3
//
//  Created by David on 12/11/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    
    //@IBOutlet weak var pageControl: UIPageControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? PageViewController {
            pageViewController.pageViewDelegate = self
            //containerView.backgroundColor = segue.source.view.backgroundColor
            
        }
    }
    
    
}

extension AppViewController: PageViewControllerDelegate {
    func pageViewController(pageViewController: PageViewController, didUpdatePageCount count: Int) {
        //pageControl.numberOfPages = count
        
    }
    
    func pageViewController(pageViewController: PageViewController, didUpdatePageIndex index: Int) {
        //pageControl.currentPage = index
        print(index)
        containerView.backgroundColor = pageViewController.orderedViewControllers[index].view.backgroundColor
    }
    
    
}

