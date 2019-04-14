//
//  DetailViewController.swift
//  NewCoreData
//
//  Created by Anh vũ on 4/11/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var ageDetail: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    var indexPath: IndexPath?
    var user: Entity?
    override func viewDidLoad() {
        super.viewDidLoad()
        if user != nil, let avatars = user?.image {
            nameDetail.text = user?.name
            ageDetail.text  = user?.age
            avatar.image    = UIImage(cgImage: avatars.cgImage!)
        }
        }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Tool" :
          guard  let detailViewController  = segue.destination as? ToolViewController else {return}
            detailViewController.users     = user
            detailViewController.indexPath = indexPath
            
        default:
            return
        }
    }
       
    }
    

  

