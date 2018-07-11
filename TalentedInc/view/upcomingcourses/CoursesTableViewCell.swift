//
//  CoursesTableViewCell.swift
//  TalentedInc
//
//  Created by Admin on 6/14/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
    
    
    @IBOutlet var courseImg: UIImageView!
    @IBOutlet var courseName: UILabel!
    @IBOutlet var instructorName: UILabel!
    @IBOutlet var startDate: UILabel!
    @IBOutlet var comment: UITextField!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeNums: UILabel!
    @IBOutlet var commentsNums: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
