//
//  MailboxViewController.swift
//  mailbox
//
//  Created by Ron Belmarch on 9/16/14.
//  Copyright (c) 2014 Belmerica. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {


    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var archiveView: UIImageView!
    @IBOutlet weak var deleteView: UIImageView!
    @IBOutlet weak var laterView: UIImageView!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var todolistView: UIImageView!
    
    var originalViewCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onPanView(gestureRecognizer: UIPanGestureRecognizer) {

        mainView.backgroundColor = UIColor.grayColor()
        
        var location = gestureRecognizer.locationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        var translation = gestureRecognizer.translationInView(view)
        
        archiveView.frame.origin.x = 15
        deleteView.frame.origin.x = 250
        laterView.frame.origin.x = 280
        listView.frame.origin.x = 80
        
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            println("Pan began")
            originalViewCenter = containerView.center
            rescheduleView.alpha=0
            deleteView.alpha=0
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            println("Pan changed")
            containerView.center = CGPoint (x: originalViewCenter.x + translation.x, y: originalViewCenter.y)
            
   
            
            if translation.x > 60 {
                archiveView.alpha=1
                deleteView.alpha=0
                laterView.alpha=0
                listView.alpha=0
                mainView.backgroundColor = UIColor.greenColor()
                archiveView.frame.origin.x = translation.x - 45
            }
            if translation.x > 260 {
                archiveView.alpha=0
                deleteView.alpha=1
                laterView.alpha=0
                listView.alpha=0
                mainView.backgroundColor = UIColor.redColor()
                deleteView.frame.origin.x = translation.x - 45
            }
            
           if translation.x < -60 {
                archiveView.alpha=0
                deleteView.alpha=0
                laterView.alpha=1
                listView.alpha=0
                mainView.backgroundColor = UIColor.yellowColor()
                laterView.frame.origin.x = translation.x + 340
            }

            if translation.x < -260 {
                archiveView.alpha=0
                deleteView.alpha=0
                laterView.alpha=0
                listView.alpha=1
                mainView.backgroundColor = UIColor.brownColor()
                listView.frame.origin.x = translation.x + 340
            }
            


            
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            println("Pan ended")
            containerView.center = CGPoint (x: originalViewCenter.x, y: originalViewCenter.y)
            
            if translation.x < -60 && translation.x > -260 {
                todolistView.alpha=1
            }
            if translation.x < -260 {
                rescheduleView.alpha=1
            }

        }

    }

    @IBAction func onTap(sender: AnyObject) {
        todolistView.alpha=0
        rescheduleView.alpha=0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
