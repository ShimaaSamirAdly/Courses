//
//  Comments.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Comments: Decodable{
    
    let userId: Int?
    let comment: String?
    let time: String?
    let userName: String?
    let userImg: String?
    
    
    enum CodingKeys : String, CodingKey {
        case userId = "userIdOfComment"
        case comment
        case time
        case userName = "userNameOfComment"
        case userImg = "userImageOfComment"
        
    }
    
    
    
}
