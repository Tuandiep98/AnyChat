//
//  AnyChatApp.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 13/04/2022.
//

import SwiftUI
import FirebaseCore
import SwiftUIRouter

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct AnyChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView{
                RouterView(router: .main, root:.login)
                    .environment(\.router, .main)
                    .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}

extension NavigationRouter {
  static var main = NavigationRouter(routes: .all)
}
