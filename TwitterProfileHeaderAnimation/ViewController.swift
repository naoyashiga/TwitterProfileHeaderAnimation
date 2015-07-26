//
//  ViewController.swift
//  TwitterProfileHeaderAnimation
//
//  Created by naoyashiga on 2015/07/26.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollY = scrollView.contentOffset.y
        println(scrollY)
        
        if scrollY < 0 {
            let scaleRatio = 1 - scrollY / 150
            headerImageView.transform = CGAffineTransformMakeScale(scaleRatio, scaleRatio)
            headerImageView.frame.origin.y = scrollY / 2
            
        } else if scrollY > 0 {
            headerImageView.frame.origin.y = max(-headerImageView.frame.height / 5, -scrollY / 5)
            
        } else if scrollY == 0{
            
        }
        
    }
    
    //MARK: UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
    }

}

