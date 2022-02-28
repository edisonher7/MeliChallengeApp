//
//  AppDelegate.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 19/02/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        WindowRouter(window: self.window).openScreen(.navigation, fromStoryboard: .main)
        return true
    }
}

