//
//  gcdViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 31/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class gcdViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func simpleQueues()
    {
        let queue = DispatchQueue(label: "trial")
        
        queue.sync {
            for i in 1..<10{
                print("🔴",i)
            }
        }
        for i in 100..<109{
            print("🔵",i)
        }
    }
    
    func queueWithQoS()
    {
        let queue1 = DispatchQueue(label: "queue1", qos: DispatchQoS.userInitiated)
        
        let queue2 = DispatchQueue(label: "queue2", qos: DispatchQoS.utility)
        
        queue1.async {
            for i in 1..<10{
                print("🔴",i)
            }
        }
        
        queue2.async {
            for i in 100..<109{
                print("🔵",i)
            }
        }
        for i in 1000..<1009{
            print("⚪️",i)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //concurrentQueue()
        
        if let queue = inactiveQueue {
            queue.activate()
        }
        
        // quesWithDelay()
        
        // fetchImage()
        
        useWorkItem()
    }
    
    var inactiveQueue: DispatchQueue!
    func concurrentQueue(){
        
        // let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: .concurrent)
        
        
        // let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: .initiallyInactive)
        
        let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .userInitiated, attributes: [.concurrent, .initiallyInactive])
        
        
        inactiveQueue = anotherQueue
        
        anotherQueue.async {
            for i in 1..<10{
                print("🔴",i)
            }
        }
        
        anotherQueue.async {
            for i in 100..<110{
                print("🔵",i)
            }
        }
        
        anotherQueue.async {
            for i in 1000..<1010{
                print("🟢",i)
            }
        }
        
    }
    
    func quesWithDelay() {
        
        let delayQueue = DispatchQueue(label: "dealayQueue" ,qos: .userInitiated)
        
        print(Date())
        
        let additionalTime: DispatchTimeInterval = .seconds(2)
        
        //        delayQueue.asyncAfter(deadline: .now() + additionalTime){
        //            print(Date())
        //        }
        delayQueue.asyncAfter(deadline: .now() + 5){
            print(Date())
        }
    }
    
    
    func fetchImage() {
        let imageURL: URL = URL(string: "http://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png")!
        
        (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageURL, completionHandler: { (imageData, response, error) in
            
            if let data = imageData {
                print("Did download image data")
                
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                }
            }
        }).resume()
    }
    
    func useWorkItem(){
        var value = 10
        let workItem  = DispatchWorkItem{
            
            value += 5
        }
        workItem.perform()
        
        workItem.notify(queue: DispatchQueue.main){
            print(value)
        }
    }
    
    
}
