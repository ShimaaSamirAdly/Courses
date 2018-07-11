//
//  User.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

struct User: Codable {
    
    let userId : Int?
    let firstName : String?
    let lastName : String?
    let userDob : String?
    let email : String?
    let gender : String?
    let imgUrl : String?
    let userType : Int?
    let instructor : Instructor?
    let followingNumber : Int?
    let followersNumber : Int?
    let phone : String?
    let categoryCollection : [CategoryCollection]?
    let password : String?
    let fbToken : String?
    let fbId : String?
    let twitterToken : String?
    let twitterId : String?
    let googleToken : String?
    let googleId : String?
    let city : String?
    let points : Int?
    let following : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case userId = "userId"
        case firstName = "firstName"
        case lastName = "lastName"
        case userDob = "userDob"
        case email = "email"
        case gender = "gender"
        case imgUrl = "imgUrl"
        case userType = "userType"
        case instructor
        case followingNumber = "followingNumber"
        case followersNumber = "followersNumber"
        case phone = "phone"
        case categoryCollection = "categoryCollection"
        case password = "password"
        case fbToken = "fbToken"
        case fbId = "fbId"
        case twitterToken = "twitterToken"
        case twitterId = "twitterId"
        case googleToken = "googleToken"
        case googleId = "googleId"
        case city = "city"
        case points = "points"
        case following = "following"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        userDob = try values.decodeIfPresent(String.self, forKey: .userDob)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        imgUrl = try values.decodeIfPresent(String.self, forKey: .imgUrl)
        userType = try values.decodeIfPresent(Int.self, forKey: .userType)
        instructor = try Instructor(from: decoder)
        followingNumber = try values.decodeIfPresent(Int.self, forKey: .followingNumber)
        followersNumber = try values.decodeIfPresent(Int.self, forKey: .followersNumber)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        categoryCollection = try values.decodeIfPresent([CategoryCollection].self, forKey: .categoryCollection)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        fbToken = try values.decodeIfPresent(String.self, forKey: .fbToken)
        fbId = try values.decodeIfPresent(String.self, forKey: .fbId)
        twitterToken = try values.decodeIfPresent(String.self, forKey: .twitterToken)
        twitterId = try values.decodeIfPresent(String.self, forKey: .twitterId)
        googleToken = try values.decodeIfPresent(String.self, forKey: .googleToken)
        googleId = try values.decodeIfPresent(String.self, forKey: .googleId)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        points = try values.decodeIfPresent(Int.self, forKey: .points)
        following = try values.decodeIfPresent(Bool.self, forKey: .following)
    }
    
}
