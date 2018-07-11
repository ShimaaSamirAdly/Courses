//
//  Courses.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Courses: Decodable{

    let courseId: Int?
    let name: String?
    let duration: Int?
    let startDate: String?
    let endDate: String?
    let description: String?
    let noOfApplicant: Int?
    let cost: Int?
    let imageUrl: String?
    let category: CategoryCollection?
    let instructor: Instructor?
    let hostingWorkSpace: WorkSpace?
    let noOfLikes: Int?
    let noOfComments: Int?
    let liked: Bool?
    let registered: Bool?
    let rated: Bool?
    let courseStatus: Int?
    let nameOfInstructor: String?
    var courseComments: [Comments]?
    let publishedDate: String?

    enum CodingKeys : String, CodingKey {
        case courseId = "offeredCourseId"
        case name
        case duration = "durationHours"
        case startDate
        case endDate
        case description
        case noOfApplicant
        case cost
        case imageUrl
        case category = "categoryId"
        case instructor = "instructorId"
        case hostingWorkSpace = "hostingWorkSpaceId"
        case noOfLikes = "numberOfLikes"
        case noOfComments = "numberOfComments"
        case liked
        case registered
        case rated
        case courseStatus = "CourseStatus"
        case nameOfInstructor
        case courseComments
        case publishedDate
    }

}
