//
//  AuthManager.swift
//  Spotify
//
//  Created by  Ivan Kamenev on 03.06.2021.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constant {
        static let clientID = "83c3df93ceb44b81b89727ef708bf7ce"
        static let clientSecret = "7d1ead251ce94117b440d9e59f251320"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI  = "https://www.spotify.com"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constant.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(
        code: String,
        complition: @escaping ((Bool) -> Void)
    ) {
       // Get token
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken() {
        
    }
}
