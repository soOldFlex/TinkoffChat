//
//  MainIneractor.swift
//  TinkoffChat
//
//  Created by iMac on 23.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol MainIneractor {
    func runInitialVC()
    func runChatVC()
}


struct MainIneractorImpl {
    
    private let factory: MainFactory
    private let navigationViewController = UINavigationController()
    private let window: UIWindow
    
    init(factory: MainFactory, window: UIWindow) {
        self.factory = factory
        self.window = window
        
        //runInitialVC()
        runChatVC()
        displayInitialVC()
    }
}

extension MainIneractorImpl: MainIneractor {
    private func displayInitialVC() {
        if navigationViewController.viewControllers.isEmpty {
            navigationViewController.title = "Not Initial ViewController"
            let baseVC = UIViewController()
            baseVC.view.backgroundColor = .white
            navigationViewController.setViewControllers([baseVC], animated: true)
        }
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
    
     func runInitialVC() {
        let vc = factory.getProfile()
        navigationViewController.setViewControllers([vc], animated: true)
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
        
        vc.onComplete = {
            switch $0 {
            case .someEvent:
                print("Some event")
            }
        }
    }
    
    func runChatVC() {
        let vc = factory.getChat()
        navigationViewController.setViewControllers([vc], animated: true)
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}
