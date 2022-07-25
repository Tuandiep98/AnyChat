//
//  Route.swift
//  AnyChat
//
//  Created by Janeto on 25/07/2022.
//

import Foundation
import SwiftUIRouter

extension NavigationRouteLink {
  static var login: NavigationRouteLink { "/login" }
    static var homeScreen: NavigationRouteLink{"/homeScreen"}
//  static var signUp: NavigationRouteLink { "/register" }
  
//  static func userDetails(for user: User) -> NavigationRouteLink {
//    NavigationRouteLink(path: "/users/\(user.id)", meta: [
//      "user": user, /// can be used when resolving route link to a View. Check below how it's used.
//    ])
//  }
//
//  static func userDetails(for id: Int) -> NavigationRouteLink {
//    NavigationRouteLink(path: "/users/\(id)")
//  }
}

extension Array where Element == NavigationRoute {
  static var all: [NavigationRoute] {
    let login = NavigationRoute(path: "/login", destination: SignInScreenView())
      let homeScreen = NavigationRoute(path: "/homeScreen", destination: HomeScreen())
//    let register = NavigationRoute(path: "/register", destination: RegisterPage())
//    let user = NavigationRoute(path: "/users/{id}") { route in
//      /// meta "user" can passed when creating `NavigationRouteLink`. Eg. in `userDetails(for user: User)`
//      /// Useful when you go to user details page and want to show user something until detailed data comes in.
//      UserPage(user: route.meta("user") ?? User(id: route.int("id"), name: "Unknown"))
//    }

    return [login, homeScreen]
  }
}
