//
//  UpComingCoursesDetailsViewController.swift
//  TalentedInc
//
//  Created by Admin on 6/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class UpComingCoursesDetailsViewController: UITableViewController {
    
    @IBOutlet var viewModel: CourseDetailsViewModel!
    
    @IBOutlet var courseImg: UIImageView!
    @IBOutlet var courseName: UILabel!
    @IBOutlet var instructorName: UILabel!
    @IBOutlet var workSpaceName: UILabel!
    @IBOutlet var descriptionText: UITextView!
    @IBOutlet var startDate: UILabel!
    @IBOutlet var endDate: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var likesNum: UILabel!
    @IBOutlet var coummentsNum: UILabel!
    @IBOutlet var comment: UITextField!
    @IBOutlet var cost: UILabel!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var commentsTableView: UITableView!
    
    var commentsNum = 0
    var likeNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        self.courseName.text = viewModel.getCourseName()
        self.instructorName.text = viewModel.getInstructorName()
        self.workSpaceName.text = viewModel.getWorkSpaceName()
        self.descriptionText.text = viewModel.getDescription()
        self.startDate.text = viewModel.getStartDate()
        self.endDate.text = viewModel.getEndDate()
        self.duration.text = String(viewModel.getDuration())+" hours"
        self.location.text = viewModel.getLocation()
        self.likesNum.text = String(viewModel.getLikesNums())
        self.coummentsNum.text = String(viewModel.getCommentsNums())
        self.cost.text = String(viewModel.getCost())
        
        self.commentsNum = viewModel.getCommentsNums()
        self.likeNum = viewModel.getLikesNums()
        
        self.courseImg.layer.cornerRadius = self.courseImg.frame.size.width/2
        self.courseImg.clipsToBounds = true
        
        self.courseImg.sd_setImage(with: URL(string: viewModel.getCourseImg()), placeholderImage: UIImage(named: "placeholder.png"))

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setButtontext()
        
        if(viewModel.getLiked()){
            self.likeButton.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func register(_ sender: Any) {
        
        if(viewModel.checkRegistered()){
            
            viewModel.setCourseUnRegistered(courseId: viewModel.getCourseId(), publishedDate: viewModel.getPublishedDate()){
                
                self.setButtontext()
                
            }
        }else{
        
            viewModel.setCourseRegistered(courseId: viewModel.getCourseId(), publishedDate: viewModel.getPublishedDate()){
            
//                self.registerButton.setTitle("UnRegister", for: UIControlState.normal)
                self.setButtontext()
            
            }
            
            
        }
    }
    
    
    @IBAction func likeCourse(_ sender: Any) {
        
        viewModel.setCourseLiked(courseId: viewModel.getCourseId(), publishedDate: viewModel.getPublishedDate()){
            
            self.likeButton.isHidden = true
            self.likeNum = self.likeNum + 1
            self.likesNum.text = String(self.likeNum)
        }
    }
    
    
    
    @IBAction func submitCommit(_ sender: Any) {
        
        if(self.comment.text != ""){
        
            viewModel.setCourseComment(courseId: viewModel.getCourseId(), courseDate: viewModel.getPublishedDate(), comment: self.comment.text!){
            
                self.comment.text = ""
                self.commentsNum = self.commentsNum + 1
                self.coummentsNum.text = String(self.commentsNum)
                
                self.tableView.reloadData()
            }
        }
    }
    
    
    func setButtontext(){
        
        if(viewModel.checkRegistered()){
                
                self.registerButton.setTitle("Register", for: UIControlState.normal)
            
        }else{
                
                self.registerButton.setTitle("UnRegister", for: UIControlState.normal)
                
            }
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
