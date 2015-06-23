//
//  ViewController.swift
//  PTMVExample
//
//  Created by Di Chen on 6/18/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // NOTE: With AutoLayout and ClassSize, you only get the expected sizes until here.
        myLayoutViews()
    }
    
    private func myLayoutViews(){
        
        scrollView.pagingEnabled = true
        scrollView.clipsToBounds = false
        
        let frame = scrollView.frame
        let width = frame.width
        let height = frame.height
        
        var layer = scrollView.layer
        layer.borderColor = UIColor.blackColor().CGColor
        layer.borderWidth = 1.0
        layer.cornerRadius = width/2
        
        let pageCount = 5
        scrollView.contentSize = CGSizeMake(width * CGFloat(pageCount), height)
        for i in 0..<pageCount {
            var label = UILabel(frame: CGRectMake(width * CGFloat(i), 0, width, height))
            label.text = String(i)
            label.textColor = UIColor.blueColor()
            label.textAlignment = .Center
            label.font = UIFont.systemFontOfSize(30)
            scrollView.addSubview(label)
        }
        
        // Add the mask view
        var array = [CGRect]()
        let rect = CGRectMake(frame.origin.x, 0, frame.width, frame.height)
        array.append(rect)
        
        let maskColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let parentView = scrollView.superview
        let pFrame = parentView!.frame
        var maskView = PartialTransparentMaskView(frame: CGRectMake(0, 0, pFrame.width, pFrame.height), backgroundColor: maskColor, transparentRects: nil, transparentCircles:array, targetView: scrollView)
        parentView!.insertSubview(maskView, aboveSubview: scrollView)
    }

}

