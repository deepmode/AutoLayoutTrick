//
//  ViewController.swift
//  AutoLayoutTrick
//
//  Created by Eric Ho on 24/6/2017.
//  Copyright © 2017 Eric Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wrappingView:UIView!
    @IBOutlet var edgeConstraint:NSLayoutConstraint! //Cannot set this to weak as once the constraint is deactived, if set to weak, the edgeConstraint will get released.
    //@IBOutlet weak var heightConstraint:NSLayoutConstraint!
    
    var zeroHeightConstraint:NSLayoutConstraint!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func toggleDistanceControls(_ sender: UIBarButtonItem) {
        if zeroHeightConstraint == nil {
            zeroHeightConstraint = wrappingView.heightAnchor.constraint(equalToConstant: 0)
        }
        
        
        let shouldShow = !edgeConstraint.isActive
        
        if shouldShow {
            zeroHeightConstraint?.isActive = false
            //self.heightConstraint?.constant = 80.0
            edgeConstraint.isActive = true
            
        } else {
            edgeConstraint.isActive = false
            zeroHeightConstraint?.isActive = true
            //self.heightConstraint?.constant = 0.0
        }
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }

    

}

