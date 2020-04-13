//
//  toolsViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 03/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class toolsViewController: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var activityLbl: UILabel!
    @IBOutlet weak var progressLbl: UILabel!
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var stateActivity: UIActivityIndicatorView!
    @IBOutlet weak var stateProgress: UIProgressView!
    
    // track progress
    let progress = Progress(totalUnitCount: 10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateSwitch.setOn(false, animated: true)
        
        stateActivity.hidesWhenStopped = true
        
        // increse heigth of progress bar
        stateProgress.transform = stateProgress.transform.scaledBy(x: 1, y: 5)
    }
    
    @IBAction func onOffSwitch(_ sender: UISwitch) {
        if stateSwitch.isOn {
            lbl.text = "On"
        }
        else    {
            lbl.text = "Off"
        }
    }
    @IBAction func startActivity(_ sender: UIButton) {
        stateActivity.startAnimating()
        if stateActivity.isAnimating{
            activityLbl.text = "Running"
        }
    }
    @IBAction func stopActivity(_ sender: UIButton) {
        stateActivity.stopAnimating()
        activityLbl.text = "Stopped"
    }
    
    
    @IBAction func startProgress(_ sender: Any) {
        // set progress to default
        self.stateProgress.progress = 0
        self.progress.completedUnitCount = 0
        // set timer
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            guard self.progress.isFinished == false else{
                timer.invalidate()
                print("finished")
                return
            }
            
            //   update progress
            self.progress.completedUnitCount += 2
            // show updated progress
            let progressFloat = Float(self.progress.fractionCompleted)
            self.stateProgress.setProgress(progressFloat, animated: true)
            
            self.progressLbl.text = "\(Int(self.progress.fractionCompleted*100))%"
        }
    }
}
