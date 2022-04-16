//
//  GoogleLoginManager.swift
//  LoginDemo
//
//  Created by Vincent Pan on 2022/2/23.
//

import Foundation
import GoogleSignIn

class GoogleLoginManager {
    static let shared = GoogleLoginManager()
    
    private let signInConfig = GIDConfiguration.init(clientID: "41115470188-m8qli29g2dm4v44uetk8p1ur4nv7f9qa.apps.googleusercontent.com")
    
    //call in AppDelegate didFinishLaunchingWithOptions
    func delegateInit(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                // Show the app's signed-out state.
                print("sign-out")
            } else {
                // Show the app's signed-in state.
                print("sign-in")
            }
        }
    }
    
    //為了支援iOS 8以下版本，官方建議加入已棄用的
    func openUrl(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        var handled: Bool
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        return false
    }
    
    func signIn(presentViewController: UIViewController) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: presentViewController) { user, error in
            guard error == nil else { return }
            guard let user = user?.profile?.email else { return }
//            guard let emailAddress = user.profile?.email else { return }
//            guard let fullName = user.profile?.name else { return }
//            guard let givenName = user.profile?.givenName else { return }
//            guard let familyName = user.profile?.familyName else { return }
//            guard let profilePicUrl = user.profile?.imageURL(withDimension: 320) else { return }
//            guard let userID = user.userID else { return }
//            guard let idToken = user.authentication.idToken else { return }
            
            
            print("測試: \(String(describing: user))")
//            print("測試token: \(String(describing: idToken))")
//            print("測試userID: \(String(describing: userID))")
//            print("測試email: \(String(describing: emailAddress))")
//            print("email:\(String(describing: emailAddress))")
//            print("fullName:\(String(describing: fullName))")
//            print("givenName:\(String(describing: givenName))")
//            print("familyName:\(String(describing: familyName))")
//            print("profilePicUrl:\(String(describing: profilePicUrl))")
//            print("userID:\(String(describing: userID))")
//            print("idToken:\(String(describing: idToken))")
        }
    }
    
        func signOut() {
            GIDSignIn.sharedInstance.signOut()
        }
    
//    func signIn(success: (() -> Void)?, failure: (() -> Void)?, presentViewController: UIViewController) {
//        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: presentViewController) { user, error in
//            guard let user = user else { return }
//            guard let email = user.profile?.email else { return }
//            guard let uid = user.userID else { return }
//            guard let accessToken = user.authentication.idToken else { return }
//            if let parm: Parameters = SignInManager.shared.prepareDataForThirdLogin(type: .google, email: email, uid: uid , token: accessToken) {
//                SignInManager.shared.thirdLoginApi(param: parm, success: success, failure: failure)
//            } else {
//                print("error: \(String(describing: error.debugDescription))")
//            }
//        }
//    }
    
//    func signOut() {
//        GIDSignIn.sharedInstance.signOut()
//    }
    
}
