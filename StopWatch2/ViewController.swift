//
//  ViewController.swift
//  StopWatch2
//
//  Created by Junshu Liu on 9/27/17.
//  Copyright © 2017 Junshu Liu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var currentTimeLabel: NSTextField!
    
    var currentTime: Date? = nil
    var timerForCurrentTime: Timer? = nil
    

    var catchCurrentTimeForStopwatch: Date? = nil
    var timerForcatcher: Timer? = nil
    
    var theSavedStopWatchValue = 0.0
    var temp = 0.0
    var elapsedTime = 0.0
    var accumulatedTime = 0.0
    
    @IBOutlet weak var intervalLabel: NSTextField!
    
    @IBOutlet weak var startButton: NSButton!
    
    @IBOutlet var pathField: NSTextField!
    
//    var pathStr = ""
    
    var lapLabelValue = ""
    
    var counter = 0
    
    @IBOutlet weak var lapLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        currentTimeUpdate() //has write file in it
        
//        // write file:
////        let writeString = "Write this text to the file in Swift."
//        let writeString = currentTimeLabel.stringValue
//        do {
//            // Write to the file.
//            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
//        } catch let error as NSError {
//            print("Failed to write to URL.")
//            print(error)
//        }
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func currentTimeUpdate() {
        timerForCurrentTime = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(timer) in
            self.currentTime = Date()
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .medium
            
            self.currentTimeLabel.stringValue = formatter.string(from: self.currentTime!)
            
            // UPDATE - Aug 2018:
            // Write text file
            // Thanks for this video: https://www.youtube.com/watch?v=e2N0kV5YQ18
            
            // set up file path:
            print("this happens")
            let fileName = "Test"
            let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
//            let fileURL = Bundle.main.path(forResource: "time", ofType: "txt")
            
            
            print("File Path: \(fileURL.path)")
//            self.pathStr = fileURL.path
//            let destinationText = self.pathStr
//            self.path.documentView!.insertText(destinationText)
            self.pathField.stringValue = fileURL.path // Thanks: https://stackoverflow.com/questions/4769247/change-the-text-in-a-nstextfield-programatically
            
//            print("File Path: \(fileURL)")
            
            // write file:
            //        let writeString = "Write this text to the file in Swift."
            let writeString = self.currentTimeLabel.stringValue
            do {
                // Write to the file.
                try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("Failed to write to URL.")
                print(error)
            }
            
            // read file:
            var readString = ""
            do {
                readString = try String(contentsOf: fileURL)
            } catch let error as NSError {
                print("Failed to read file.")
                print(error)
            }
            
            print("CONTENT: \(readString)")
        }
    }
    
    func catchCurrentTimeUpdate() {
            self.catchCurrentTimeForStopwatch = Date()
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .medium
        
            print("Current time catched.")
            print(formatter.string(from: self.catchCurrentTimeForStopwatch!))
    }
    
    
    
    func convertSecondsToHMSFormat (seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        // These 3 integers represents: Hours, Minutes, Seconds
        // Thanks for https://stackoverflow.com/questions/26794703/swift-integer-conversion-to-hours-minutes-seconds
    }
    
    func startStopWatchTimer() {
        //            catchCurrentTimeUpdate()
        
        timerForcatcher = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(timer) in
            
            let catchedTime = self.catchCurrentTimeForStopwatch
            
            self.lapLabelValue = self.intervalLabel.stringValue
            
            self.elapsedTime = self.currentTime!.timeIntervalSince(catchedTime!)
            
            self.theSavedStopWatchValue = self.elapsedTime
            
            //print(self.theSavedStopWatchValue)
            
            self.accumulatedTime = self.temp + self.elapsedTime + 1
            // Explain: Why PLUS 1?
            // Like the "current time" (when I run the program, the current time won't show during the 1st second), the TIMER will delay 1 second (that's the 1st second) after I hit the "Start" button to start the stopwatch. HOWEVER, typically when user press start, the stopwatch should start running immediately. So, I add 1 additional second.
            
            print("TEMP  \(self.temp)")
            print("ELPSD \(self.elapsedTime)")
            print("TOTAL \(self.accumulatedTime)")
            
            //var newElapsedTime = String(elapsedTime) + self.lapLabelValue
            // I tried to accumulate the times for the stop watch. Not working at this moment.
            
            
            
//            if self.counter % 2 == 1 {
//                elapsedTime = elapsedTime + self.currentTime!.timeIntervalSince(catchedTime!)
//            }
            
            //                self.intervalLabel.stringValue = "\(elapsedTime)"
            let (h,m,s) = self.convertSecondsToHMSFormat(seconds: Int(self.accumulatedTime))
            // Thanks for https://stackoverflow.com/questions/26794703/swift-integer-conversion-to-hours-minutes-seconds
            //                if s < 10 {
            //                    self.intervalLabel.stringValue = "\(h):\(m):0\(s)"
            //                }
            //                else {
            //                    self.intervalLabel.stringValue = "\(h):\(m):\(s)"
            var fh = ""
            var fm = ""
            var fs = ""
            
            if (h < 10) {
                fh = "0\(h)"
            } else {
                fh = String(h)
            }
            
            if (m < 10) {
                fm = "0\(m)"
            } else {
                fm = String(m)
            }
            
            if (s < 10) {
                fs = "0\(s)"
            } else {
                fs = String(s)
            }
            
            
            self.intervalLabel.stringValue = "\(fh):\(fm):\(fs)"
            
            //self.intervalLabel.stringValue = newElapsedTime
            
        }
        
    }
    
    @IBAction func updateStopwatch(_ sender: Any) {
        counter = counter + 1
        print(counter)
        if counter == 1 {
            intervalLabel.stringValue = "00:00:00"
        }
        
//        if counter == 1 || counter % 2 == 1 {
//            catchCurrentTimeUpdate()
//            print("Actual Current Time -- \(currentTime)")
//        }
        
        if let t = timerForcatcher {
            t.invalidate()
            startButton.title = "Start"
            timerForcatcher = nil
            //lapLabelValue = self.intervalLabel.stringValue
            if counter == 2 {
                temp = theSavedStopWatchValue
            } else {
                temp = accumulatedTime
            }
        } else {
            catchCurrentTimeUpdate()
            print("Actual Current Time -- \(currentTime)")
            
            startStopWatchTimer()
            startButton.title = "Stop"
            //lapLabelValue = self.intervalLabel.stringValue
        }
        
        
        
    }
    
    @IBAction func lap(_ sender: Any) {
        lapLabelValue = self.intervalLabel.stringValue
        self.lapLabel.stringValue = lapLabelValue
        print(lapLabelValue)

    }
        
    @IBAction func reset(_ sender: Any) {
//        temp = 1.0
////        accumulatedTime = 0.0
//        catchCurrentTimeUpdate()
//        startStopWatchTimer()
        
        theSavedStopWatchValue = 0.0
        temp = 0.0
        elapsedTime = 0.0
        accumulatedTime = 0.0
        
        intervalLabel.stringValue = "00:00:00"
        
        if counter == 1 || counter % 2 == 1 {
            
            catchCurrentTimeUpdate()
        
            //"Reboot" the timer.
        
            if let t = timerForcatcher {
                t.invalidate()
            }
            startStopWatchTimer()
        
            print("Actual Current Time -- \(currentTime)")
        
        }
    }
}
