//
//  CoursesClient.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire


class CoursesClient: NSObject {
    
    
    func getUpComingCourses(userId: Int, pageNum: Int, completion: @escaping (CourseResponse?)->Void) {
        
        guard let url = URL(string: "http://192.168.43.40:3000/publishedCourses/upComing?userId=\(userId)&page=\(pageNum)") else {
            completion(nil)
            return
        }
        
        Alamofire.request(url)
            .responseJSON { response in
                guard let data = response.data else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                print(response.result)
                
                do{
                    let courseResponse = try JSONDecoder().decode(CourseResponse.self, from: data)
                    
                    print("decoding data")
                    
                    completion(courseResponse)
                }catch{
                    print(error)
                }
        }
    }
    
    
    func setCourseRegistered(userId: Int, courseId: Int, courseDate: String, completion: @escaping ()->()) {
        
        guard let url = URL(string: "http://192.168.43.40:3000/publishedCourses/register?userId=\(userId)&courseId=\(courseId)&courseDate=\(courseDate)") else {
            
            return
        }
        
        Alamofire.request(url, method: .post)
            .responseJSON { response in
                guard let data = response.data else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    
                    return
                }
                print(response.result)
                
                completion()
                
        }
    }
    
    func setCourseUnRegistered(userId: Int, courseId: Int, courseDate: String, completion: @escaping ()->()) {
        
        guard let url = URL(string: "http://192.168.43.40:3000/publishedCourses/unRegister?userId=\(userId)&courseId=\(courseId)&courseDate=\(courseDate)") else {
            
            return
        }
        
        Alamofire.request(url, method: .delete)
            .responseJSON { response in
                guard let data = response.data else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    
                    return
                }
                print(response.result)
                
                completion()
                
        }
    }
    
    
    func setCourseLiked(userId: Int, courseId: Int, courseDate: String, completion: @escaping ()->()) {
        
        guard let url = URL(string: "http://192.168.43.40:3000/publishedCourses/LikeCourse?userId=\(userId)&courseId=\(courseId)&courseDate=\(courseDate)") else {
            
            return
        }
        
        Alamofire.request(url, method: .post)
            .responseJSON { response in
                guard let data = response.data else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    
                    return
                }
                print(response.result)
                
                completion()
                
        }
    }
    
    func setCourseDisLiked(userId: Int, courseId: Int, courseDate: String, completion: @escaping ()->()) {
        
        guard let url = URL(string: "http://192.168.43.40:3000/publishedCourses/disLikeCourse?userId=\(userId)&courseId=\(courseId)&courseDate=\(courseDate)") else {
            
            return
        }
        
        Alamofire.request(url, method: .post)
            .responseJSON { response in
                guard let data = response.data else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    
                    return
                }
                print(response.result)
                
                completion()
                
        }
    }
    
    func setCourseComment(userId: Int, courseId: Int, courseDate: String, comment: String, completion: @escaping ()->()) {
        
        guard let url = URL(string: "http://192.168.43.40:3000/publishedCourses/commentOnCourse?userId=\(userId)&courseId=\(courseId)&courseDate=\(courseDate)&comment=\(comment)") else {
            
            return
        }
        
        Alamofire.request(url, method: .post)
            .responseJSON { response in
                guard let data = response.data else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    
                    return
                }
                print(response.result)
                
                completion()
                
        }
    }
}
