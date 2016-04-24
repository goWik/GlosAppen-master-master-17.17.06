//
//  Lista.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-13.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import Foundation
import AVFoundation



//:MARK PROTOKOLS
protocol ListProtokolType {
    
    var word1:String {get set}
    var word2:String {get set}
  
    init(word1:String, word2:String)
    
}


protocol ListDescribeType {
    
    var name:String {get set}
    var language1:String {get set}
    var language2:String {get set}
    var glosListorArray:[Lista] {get set}
    
    init(name:String,language1:String,language2:String,glosListorArray:[Lista])
    
}


//:MARK CLASSES
class Lista: ListProtokolType , CustomStringConvertible {

    var word1:String
    var word2:String
    
  
    required init(word1: String, word2: String) {
        self.word1 = word1
        self.word2 = word2
    }
    
    var description: String {
        return "\(word1),\(word2)"
    }
    
}


class ListDescribe: ListDescribeType, CustomStringConvertible {

    var name:String
    var language1:String
    var language2:String
    var glosListorArray:[Lista] = []
    
    
    
    required init(name:String, language1:String,language2:String, glosListorArray:[Lista]) {
        self.name = name
        self.language1 = language1
        self.language2 = language2
        self.glosListorArray = glosListorArray
    }
    


    var description: String {
        return "\(name), \(language1), \(language2), \(glosListorArray)"
    }
    
}


//:MARK STRUCT
struct HelperStruct {
    
  var audioFile = AVAudioPlayer()
    
  var audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("mySound", ofType: "wav")!)
    
    
    mutating func playAudio(){
        do {
            try audioFile = AVAudioPlayer(contentsOfURL: audioPath, fileTypeHint: nil)
            audioFile.play()
            print("fil exist")
        } catch {
            print("file not found")
        }
    }
    

    func dateFormatter()-> String{
        let clock = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        
    return formatter.stringFromDate(clock)
    }
    
}




