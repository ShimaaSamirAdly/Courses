//
//  UpComingCoursesViewController.swift
//  TalentedInc
//
//  Created by Admin on 6/14/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class UpComingCoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var viewModel: UpComingCoursesViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getUpcomingCourses(pageNum: 0){
            print("vieeew")
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numOfRowsInSection()
    }
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer, indexPath: IndexPath) {
        self.viewModel.gg(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoursesTableViewCell
        
        cell.courseImg.layer.cornerRadius = cell.courseImg.frame.size.width/2
        cell.courseImg.clipsToBounds = true
        
        cell.courseImg.sd_setImage(with: URL(string: viewModel.getCourseImg(indexPath: indexPath)), placeholderImage: UIImage(named: "placeholder.png"))
        
        cell.courseName.text = viewModel.getCourseName(indexPath: indexPath)
        cell.instructorName.text = viewModel.getInstructorName(indexPath: indexPath)
        cell.commentsNums.text = String(viewModel.getCommentsNums(indexPath: indexPath))
        cell.likeNums.text = String(viewModel.getLikesNums(indexPath: indexPath))
        cell.startDate.text = viewModel.getStartDate(indexPath: indexPath)
        cell.likeButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        
        return cell
    }
    
    @objc func buttonAction(sender: UIButton)
    {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(viewModel.checkForEndingScroll(indexPath: indexPath)){
            print("oook")
            viewModel.getUpcomingCourses(pageNum: viewModel.getPageNum()) {
                self.tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let courseDetailsView = self.storyboard?.instantiateViewController(withIdentifier: "detailsView") as! UpComingCoursesDetailsViewController
        
        courseDetailsView.viewModel.course = viewModel.getCourseDetails(indexPath: indexPath)
        
        self.navigationController?.pushViewController(courseDetailsView, animated: true )
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
