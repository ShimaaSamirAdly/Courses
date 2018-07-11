//
//  CourseResponse.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct CourseResponse: Decodable{
    
    let pageNumber: Int?
    let totalCourses: Int?
    let totalPages: Int?
    let courses: [Courses]?
    
    
    enum CodingKeys : String, CodingKey {
        case pageNumber
        case totalCourses = "totalNumberOfUpComingCourses"
        case totalPages = "totalNumberOfPages"
        case courses = "result"
    }

}
