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
    
    @IBOutlet var tableViewHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        let nibName = UINib(nibName: "TableViewCell", bundle:nil)
        tableView.registerNib(nibName, forCellReuseIdentifier: "TableViewCell")
        
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
            let headerHeightMovingSpeed = 135 - scrollY / 1
            let minHeight: CGFloat = 50
            
            tableViewHeightConstraint.constant = max(minHeight, headerHeightMovingSpeed)
            view.layoutIfNeeded()
            
        } else if scrollY == 0{
            
        }
        
    }
    
    //MARK: UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
        cell.titleLabel.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
    }

}

