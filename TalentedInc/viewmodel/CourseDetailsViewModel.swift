//
//  CourseDetailsViewModel.swift
//  TalentedInc
//
//  Created by Admin on 6/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CourseDetailsViewModel: NSObject {
    
    var course: Courses?
    
    @IBOutlet var courseClient: CoursesClient!
    
    func getCourseId()->Int{
        
        return course!.courseId ?? -1
//        return 1
    }
    
    func getCourseName()-> String{
        return course!.name ?? ""
//        return "Java"
    }
    
    func getInstructorName()-> String{
        return course!.nameOfInstructor ?? ""
//        return ""
    }
    
    func getStartDate()-> String{
        return course!.startDate ?? ""
//        return ""
    }
    
    func getLikesNums()-> Int{
        return course!.noOfLikes ?? 0
//        return 0
    }
    
    func getCommentsNums()-> Int{
        return course!.noOfComments ?? 0
//        return 0
    }
    
    func getWorkSpaceName()->String{
        return course!.hostingWorkSpace?.name ?? ""
//        return ""
    }
    
    func getLocation()->String{
        return course!.hostingWorkSpace?.address ?? ""
//        return ""
    }
    
    func getDuration()->Int{
        return course!.duration ?? 0
//        return 0
    }
    
    func getEndDate()->String{
        return course!.endDate ?? ""
//        return ""
    }
    
    func getCost()->Int{
        return course!.cost ?? 0
//        return 0
    }
    
    func getDescription()->String{
        return course!.description ?? ""
//        return ""
    }
    
    func getPublishedDate()->String{
        return course!.publishedDate ?? ""
//        return ""
    }
    
    func checkRegistered()->Bool{
        return course!.registered ?? false
//        return true
    }
    
    func setCourseRegistered(courseId: Int, publishedDate: String, completion: @escaping ()->()){
        
        self.courseClient.setCourseRegistered(userId: 2, courseId: courseId, courseDate: publishedDate){
            
//            self.course?.registered = true
            
            completion()
        }
    }
    
    func setCourseUnRegistered(courseId: Int, publishedDate: String, completion: @escaping ()->()){
        
        self.courseClient.setCourseUnRegistered(userId: 2, courseId: courseId, courseDate: publishedDate){
            
            completion()
        }
    }
    
    func setCourseLiked(courseId: Int, publishedDate: String, completion: @escaping ()->()){
        
        self.courseClient.setCourseLiked(userId: 2, courseId: courseId, courseDate: publishedDate){
            
            completion()
        }
    }
    
    func setCourseDisLiked(courseId: Int, publishedDate: String, completion: @escaping ()->()){
        
        self.courseClient.setCourseDisLiked(userId: 2, courseId: courseId, courseDate: publishedDate){
            
            completion()
        }
    }
    
    func getLiked()->Bool{
        
       return course?.liked ?? false
    }
    
    func setCourseComment(courseId: Int, courseDate: String, comment: String, completion: @escaping ()->()) {
        self.courseClient.setCourseComment(userId: 2, courseId: courseId, courseDate: courseDate, comment: comment){
            let newComment: Comments = Comments(userId: 2, comment: comment, time: nil, userName: "", userImg: "")
            self.course?.courseComments?.append(newComment)
            completion()
        }
    }
    
    func getCommentsCount()->Int{
        
        return self.course?.courseComments?.count ?? 0
    }
    
    func getCourseImg()->String{
        
        return course?.imageUrl ?? ""
    }
    
    func getCommentName(indexPath: IndexPath)->String{
        let comment = self.course?.courseComments![indexPath.row]
        print(comment?.userName ?? "")
        return comment?.userName ?? ""
        
        
    }
    
    func getCommentBody(indexPath: IndexPath)->String{
        let comment = self.course?.courseComments![indexPath.row]
        return comment?.comment ?? ""
    }
    
    func getCommentImage(indexPath: IndexPath)->String{
        let comment = self.course?.courseComments![indexPath.row]
        return comment?.userImg ?? ""
    }
    

}
