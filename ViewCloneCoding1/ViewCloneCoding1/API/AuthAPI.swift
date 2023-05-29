//
//  File.swift
//  ViewCloneCoding1
//
//  Created by 조영준 on 2023/05/21.
//

import Foundation

enum AuthAPI {
    case login
    case signup
    
    func path() -> String {
        switch self {
        case .login:
            return "/user/login"
        case .signup:
            return "/user/signup"
        }
    }
}
