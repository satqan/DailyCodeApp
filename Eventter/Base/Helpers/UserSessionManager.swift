//
//  UserSessionManager.swift
//  Eventter
//
//  Created by Zhussupali Salamat on 14.09.2022.
//

import Foundation
import UIKit

class UserSessionManager {
    static let shared = UserSessionManager()
    private let userDefaults = UserDefaults.standard
    private let currentUserIdentifier = "currentUserIdentifier"
    private let tempUsrID = "tempUsrId"
    private(set) var currentUser: User?
    
    private init() {}
    
    func setCurrentUser(user: User) {
        self.currentUser = user
    }
    
    func createSession(withUser user: Authorization) {
        let encoder = JSONEncoder()
        if let userData = try? encoder.encode(user) {
            userDefaults.set(userData, forKey: currentUserIdentifier)
            userDefaults.synchronize()
        } else {
            print("can't save user session")
        }
    }
    
    func updateUsrData(withUser user: UpdateUsr) {
        let data = getCurrentUser()
        let emptyData = Authorization(user: user.user, access_token: data?.access_token)
        
        let encoder = JSONEncoder()
        if let userData = try? encoder.encode(emptyData) {
            userDefaults.set(userData, forKey: currentUserIdentifier)
            userDefaults.synchronize()
        } else {
            print("can't save user session")
        }
    }
    
    func getCurrentUser() -> Authorization? {
        if let userData = userDefaults.value(forKey: currentUserIdentifier) as? Data {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(Authorization.self, from: userData) {
                return user
            }
            return nil
        } else {
            return nil
        }
    }
    
    func deleteCurrentSession() {
        userDefaults.set(nil, forKey: currentUserIdentifier)
        userDefaults.synchronize()
    }
    
    func getToken() -> String? {
        if let userData = userDefaults.value(forKey: currentUserIdentifier) as? Data {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(Authorization.self, from: userData) {
                return user.access_token
            }
            return nil
        } else {
            return nil
        }
    }

    func saveTempUsrID(id: Int) {
        userDefaults.set(id, forKey: tempUsrID)
        userDefaults.synchronize()
    }
    
    func getTempUsrID() -> Int? {
        return userDefaults.integer(forKey: tempUsrID)
    }

    func deleteTempUsrID() {
        userDefaults.set(nil, forKey: tempUsrID)
        userDefaults.synchronize()
    }
}

struct Authorization: Codable {
    let user: User?
    let access_token: String?
}

struct UpdateUsr: Codable {
    let user: User?
    let access_token: String?
    let message: Bool?
}

struct User: Codable {
    var photo: UIImage?
    var first_name: String?
    var last_name: String?
    var leetcode_username: String?
    var password: String?
    
    enum CodingKeys: String, CodingKey {
        case  first_name, last_name, leetcode_username, password
    }
}


    


