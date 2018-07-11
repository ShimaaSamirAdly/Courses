//
//  UpComingCoursesViewModel.swift
//  TalentedInc
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class UpComingCoursesViewModel: NSObject {
    
    @IBOutlet var coursesClient: CoursesClient!
    var coursesResponse: CourseResponse?
    var courses: [Courses] = []
    var pageNum: Int = 0
    
    func getUpcomingCourses(pageNum: Int, completion: @escaping ()->()){
        
        if(pageNum == 0){
            courses.removeAll()
            self.pageNum = pageNum
            print(courses.count)
        }
        
        coursesClient.getUpComingCourses(userId: 2, pageNum: pageNum){ courseResponse in
            
            self.coursesResponse = courseResponse
            
            self.courses = self.courses + (self.coursesResponse?.courses)!
            print("hhhhhh")
            print("in viewModel")
            completion()
        }
    }
    
    func getPageNum()->Int{
        return pageNum
    }
    
    func gg(indexPath: IndexPath){
        print(indexPath.row)
    }
    
    func checkForEndingScroll(indexPath: IndexPath)->Bool{
        
        if(indexPath.row == (courses.count)-1 && (coursesResponse?.pageNumber)! < (coursesResponse?.totalPages)!){
            print((courses.count)-1)
            print(indexPath.row)
            pageNum = (coursesResponse?.pageNumber)!+1
            return true
        }
        
        return false
    }
    
    func numOfRowsInSection()-> Int{
    
        return courses.count 
    }
    
    func getCourseImg(indexPath: IndexPath)->String{
       
        return courses[indexPath.row].imageUrl ?? ""
        
    }
    
    func getCourseName(indexPath: IndexPath)-> String{
        
        return courses[indexPath.row].name ?? ""
        
    }
    
    func getInstructorName(indexPath: IndexPath)-> String{
        
        return courses[indexPath.row].nameOfInstructor ?? ""
        
    }
    
    func getStartDate(indexPath: IndexPath)-> String{
        
        return courses[indexPath.row].startDate ?? ""
        
    }
    
    func getLikesNums(indexPath: IndexPath)-> Int{
        
        return courses[indexPath.row].noOfLikes ?? 0
       
    }
    
    func getCommentsNums(indexPath: IndexPath)-> Int{
        
        return courses[indexPath.row].noOfComments ?? 0
        
    }
    
    
    func getCourseDetails(indexPath: IndexPath)->Courses{
        return courses[indexPath.row]
    }
    
    func setCourseLiked(indexPath: IndexPath, publishedDate: String, completion: @escaping ()->()){
        
        var courseId: Int = courses[indexPath.row].courseId!
        self.coursesClient.setCourseLiked(userId: 2, courseId: courseId, courseDate: publishedDate){
            
            completion()
        }
    }
    
    
    func getLiked(indexPath: IndexPath)->Bool{
        
        return courses[indexPath.row].liked!
    }
    
    func setCourseComment(indexPath: IndexPath, courseDate: String, comment: String, completion: @escaping ()->()) {
        var courseId: Int = courses[indexPath.row].courseId!
        self.coursesClient.setCourseComment(userId: 2, courseId: courseId, courseDate: courseDate, comment: comment){
            completion()
        }
    }

}
