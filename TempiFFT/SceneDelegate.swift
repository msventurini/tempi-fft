//
//  SceneDelegate.swift
//  TempiFFT
//
//  Created by Matheus Silveira Venturini on 17/09/26.
//  Copyright © 2026 John Scalo. All rights reserved.
//


import UIKit
import Foundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?


    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SpectralViewController()
        window?.makeKeyAndVisible()
        
        
        
        
        

    }
}
