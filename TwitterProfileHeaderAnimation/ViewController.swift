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
    
    @IBOutlet var blurredImageView: UIImageView!
    @IBOutlet var headerImageViewHeightConstraint: NSLayoutConstraint!
    
    var headerBackgroundImage: UIImage? {
        didSet {
            let blurRadius: CGFloat = 20.0
            headerImageView.image = headerBackgroundImage
            blurredImageView.image = headerImageView.image?.applyBlurWithRadius(blurRadius, tintColor: nil, saturationDeltaFactor: 1.0, maskImage: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        let nibName = UINib(nibName: "TableViewCell", bundle:nil)
        tableView.registerNib(nibName, forCellReuseIdentifier: "TableViewCell")
        
        headerBackgroundImage = UIImage(named: "sea-sky-beach-holiday.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollY = scrollView.contentOffset.y
        
//        println(scrollY)
        if scrollY < 0 {
            let scaleRatio = 1 - scrollY / 150
            headerImageView.transform = CGAffineTransformMakeScale(scaleRatio, scaleRatio)
            blurredImageView.transform = CGAffineTransformMakeScale(scaleRatio, scaleRatio)
            
            let blurRatio = -scrollY / 150
            
            blurredImageView.alpha = min(1.0, blurRatio)
            
        } else if scrollY > 0 {
            let headerHeightMovingSpeed = -scrollY / 2
            let minHeight: CGFloat = view.frame.height * headerImageViewHeightConstraint.multiplier / 2
            let constant: CGFloat = view.frame.height * headerImageViewHeightConstraint.multiplier - minHeight
            
            headerImageViewHeightConstraint.constant = max(-constant, headerHeightMovingSpeed)
            view.layoutIfNeeded()
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

