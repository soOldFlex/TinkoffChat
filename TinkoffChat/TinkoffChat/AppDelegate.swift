//
//  AppDelegate.swift
//  TinkoffChat
//
//  Created by Admin on 16.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Aplication moved from <NotInitialization> to <First Initialization> : \(#function) \n")
        return true
    }

    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("Application moved from <First Initialization> to <Final Initialization> : \(#function) \n")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Application moved from <Inactive> to <Active> : \(#function) \n")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Applictation moved from <Active> to <Inactive> : \(#function) \n")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Applictation moved from <Inactive> to <Background> : \(#function) \n")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Applictation moved from <Background> to <Inactive> : \(#function) \n")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("Applictation moved from <Initialized> to <Deinitializated> : \(#function) \n")
    }
    
}

