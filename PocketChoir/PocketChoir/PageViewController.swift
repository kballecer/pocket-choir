//
//  PageViewController.swift
//  Project_3
//
//  Created by David on 12/10/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import AudioKit

var audioEngine: AudioEngine!

class PageViewController: UIPageViewController {
    
    weak var pageViewDelegate: PageViewControllerDelegate?
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController(id: "chord"), self.newViewController(id: "control"), self.newViewController(id: "sample")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        pageViewDelegate?.pageViewController(pageViewController: self, didUpdatePageCount: orderedViewControllers.count)
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        
        audioEngine = AudioEngine()
        
    }
    
    private func newViewController(id: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(id)ViewController")
    }
    
    @objc func update() {
        
        
    }
    
}


extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count >  previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}

extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            pageViewDelegate?.pageViewController(pageViewController: self, didUpdatePageIndex: index)
        }
    }
}


protocol PageViewControllerDelegate: class {
    func pageViewController(pageViewController: PageViewController, didUpdatePageCount count: Int)
    
    func pageViewController(pageViewController: PageViewController, didUpdatePageIndex index: Int)
}


















