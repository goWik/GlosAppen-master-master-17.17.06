//
//  Lista.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-13.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import Foundation
import UIKit

protocol ListProtokolType {
    
    var word1:String {get set}
    var word2:String {get set}
  
    
    init(word1:String, word2:String)
    
    func createGlosObj(word1:String, word2:String) -> Lista
}


protocol ListDescribeType {
    
    var name:String {get set}
    var language1:String {get set}
    var language2:String {get set}
    var glosListorArray:[Lista] {get set}
    
    init(name:String,language1:String,language2:String,glosListorArray:[Lista])
    
}


class Lista: ListProtokolType , CustomStringConvertible {

    var word1:String
    var word2:String
    
  
    required init(word1: String, word2: String) {
        self.word1 = word1
        self.word2 = word2
    }
    

    func createGlosObj(word1:String, word2:String) -> Lista  {
        
        let objGlosa = Lista(word1: word1, word2: word2)
        print("ord1: \(objGlosa.word1), ord2: \(objGlosa.word2)")

        return objGlosa
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


class HelperFunc {
    
    func dateFormater()-> String{ //func returnerar dagens datum
        let clock = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .LongStyle
        
    return formatter.stringFromDate(clock)
    }
    
}




