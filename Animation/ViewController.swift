//
//  ViewController.swift
//  Animation
//
//  Created by RASHED on 7/22/17.
//  Copyright © 2017 RASHED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var image: UIImageView!
    
    @IBAction func fadeIn(_ sender: Any) {
        
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
        
         self.image.alpha = 1
            
        })
        
    }
    
    @IBAction func slideIn(_ sender: Any) {
        
        //CG means core graphics
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration : 2){
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        
        }
        
    }
    
    
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1){
            
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
        
    }
      var counter = 1
      var isAnimating = false
      var timer = Timer()
    
    func animate(){
        image.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        
        counter += 1
        
        if counter == 6 {
            
            counter = 0
            
        }
    
    }
    @IBAction func next(_ sender: Any) {
        
        if isAnimating{
          timer.invalidate()
            button.setTitle("Start Animation", for: [])
            isAnimating = false
            
        }else {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            button.setTitle("Stop Animation", for: [])
            isAnimating = true
        
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

