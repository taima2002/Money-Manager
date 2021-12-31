//
//  SelectCategoryViewController.swift
//  Money Manager
//
//  Created by TaLi on 12/31/21.
//

import UIKit

class SelectCategoryViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    var pageVC: UIPageViewController = UIPageViewController()
    var viewControllers :[UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func configPageViewController() {
        self.pageVC.delegate = self
        self.pageVC.dataSource = self
        viewControllers.append(CategoyViewController.createVC(listCategory: CategoryManager.shared.expenseCategories, pageIndex: 0))
        viewControllers.append(CategoyViewController.createVC(listCategory: CategoryManager.shared.incomeCategory, pageIndex: 1))
        self.pageVC.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pageVC" {
            self.pageVC = segue.destination as! UIPageViewController
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = pageViewController.viewControllers?.first
        var index: Int
        index = getVCPageIndex(vc)
        
        if index == 0 {
            return nil
        } else {
            index -= 1
            return self.viewControllers[index]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = pageViewController.viewControllers?.first
        var index: Int
        index = getVCPageIndex(vc)
        // Don't do anything when viewpager reach the number of tabs
        if index == self.viewControllers.count {
            return nil
        } else {
            index += 1
            return self.viewControllers[index]
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            if completed {
                guard let vc = pageViewController.viewControllers?.first else { return }
                let index: Int
                index = getVCPageIndex(vc)
                self.selectedTab(index: index)
            }
        }
    }
    func getVCPageIndex(_ viewController: UIViewController?) -> Int {
        if let vc = viewController as? CategoyViewController {
            return vc.pageIndex
        }
        return -1
    }
    func selectedTab(index: Int) {
        
    }
}
