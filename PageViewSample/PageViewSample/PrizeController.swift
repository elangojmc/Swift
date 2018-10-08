//
//  ViewController.swift
//  PrizeRandomizerDemo
//
//  Created by Brian Voong on 9/14/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

class PrizePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let shuffleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Random", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor(red: 65/255, green: 5/255, blue: 5/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleShuffle), for: .touchUpInside)
        return button
    }()
    
    fileprivate func setupShuffleButton() {
        view.addSubview(shuffleButton)
        shuffleButton.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 12, right: 24), size: .init(width: 0, height: 50))
    }
    
    let controllers = (0...5).map { (i) -> PrizeController in
        let vc = PrizeController()
        vc.prizeIndex = i
        return vc
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        setupShuffleButton()
        
        setViewControllers([controllers.first!], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func handleShuffle() {
        let currentIndex = controllers.firstIndex(of: viewControllers!.first as! PrizeController) ?? 0
        var randomIndex = Int.random(in: 0..<controllers.count)
        while randomIndex == currentIndex {
            randomIndex = Int.random(in: 0..<controllers.count)
        }
        let direction = randomIndex > currentIndex ? UIPageViewController.NavigationDirection.forward : .reverse
        let vc = controllers[randomIndex]
        
        setViewControllers([vc], direction: direction, animated: true)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController as! PrizeController), index != 0 {
            return controllers[index - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController as! PrizeController), index != controllers.count - 1 {
            return controllers[index + 1]
        }
        return nil
    }
    
}



