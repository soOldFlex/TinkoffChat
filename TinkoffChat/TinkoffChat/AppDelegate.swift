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
        #if DEBUG
        print("Aplication moved from <NotInitialization> to <First Initialization> : \(#function) \n")
        #endif
        return true
    }

    func applicationDidFinishLaunching(_ application: UIApplication) {
        #if DEBUG
        print("Application moved from <First Initialization> to <Final Initialization> : \(#function) \n")
        #endif
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        #if DEBUG
        print("Application moved from <Inactive> to <Active> : \(#function) \n")
        #endif
    }

    func applicationWillResignActive(_ application: UIApplication) {
        #if DEBUG
        print("Applictation moved from <Active> to <Inactive> : \(#function) \n")
        #endif
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        #if DEBUG
        print("Applictation moved from <Inactive> to <Background> : \(#function) \n")
        #endif
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        #if DEBUG
        print("Applictation moved from <Background> to <Inactive> : \(#function) \n")
        #endif
    }

    func applicationWillTerminate(_ application: UIApplication) {
        #if DEBUG
        print("Applictation moved from <Initialized> to <Deinitializated> : \(#function) \n")
        #endif
    }
    
}

