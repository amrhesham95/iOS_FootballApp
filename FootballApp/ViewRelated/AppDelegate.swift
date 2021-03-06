//
//  AppDelegate.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/15/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        // register coder, on AppDelegate
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        let leaguesScreenViewController = LeaguesScreenViewController(viewModel: LeaguesScreenViewModel())
        let navigationController = UINavigationController(rootViewController: leaguesScreenViewController)
        self.window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }



}

