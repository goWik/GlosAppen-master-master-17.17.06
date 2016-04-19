//
//  CreateJson.swift
//  glosor
//
//  Created by gm on 2016-04-14.
//  Copyright © 2016 gm. All rights reserved.
//

import Foundation

class CreateJSONFile{
    
    // Error types----------------
    enum FileErrors:ErrorType {
        case JsonNotSerialized
        case FileNotSaved
        case FileNotRead
        case FileNotFound
    }
    
    //sökvägar och filhantering
    //--------------MAP---------------------
    private let directory:NSSearchPathDirectory //namnet på mappen i vilken ligger data
    private let directoryPath:String //söktväg till mappen directoryPath
    private let fileManager = NSFileManager.defaultManager()
    
    //-----------FIL------------------------
    private let fileName:String  //namn på filen
    private let filePath:String  //sökväg till filen
    private let minFiled:String = ".json"  //filtyp
    
    private let fullyQualifiedPath:String //sökväg till filen
    private let subDirectory:String//namet på undermappen
    
    
    
    //Funktion som kollar om filen finns
    var fileExists:Bool {
        get {
            return fileManager.fileExistsAtPath(fullyQualifiedPath)
        }
    }
    
    //Funktion som kollar om sökvägen finns
    var directoryExists:Bool {
        get {
            var isDir = ObjCBool(true)
            return fileManager.fileExistsAtPath(filePath, isDirectory: &isDir )
        }
    }
    
    
    
    
    //skapar en huvudkonstruktor , har flest paramtrar
    convenience init(fileName:String, minFiled:String, subDirectory:String){
        self.init(fileName:fileName, minFiled:minFiled, subDirectory:subDirectory, directory:.DocumentDirectory)
    }
    
    
    //skapar andra init
    convenience init(fileName:String, minFiled:String){
        self.init(fileName:fileName, minFiled:minFiled, subDirectory:"", directory:.DocumentDirectory)
    }
    
    
    init(fileName:String, minFiled:String, subDirectory:String, directory:NSSearchPathDirectory){
        
        self.fileName = fileName + minFiled //namn på  filen + j.son
        self.subDirectory = "/\(subDirectory)"//namet på undermappen
        self.directory = directory//namet på mappen där data ligger
        
        self.directoryPath = NSSearchPathForDirectoriesInDomains(directory, .UserDomainMask, true)[0]
        self.filePath = directoryPath + self.subDirectory
        self.fullyQualifiedPath = "\(filePath)/\(self.fileName)"//rätta sökväg, säkväf till filen namet på filen
        createDirectory()//skapar mappen-----
        
        print(self.directoryPath)//skriver ut---------
    }
    
    
    //Skapar mappen
    private func createDirectory(){
        //om sökvägen finns
        if !directoryExists {
            do {
                try fileManager.createDirectoryAtPath(filePath, withIntermediateDirectories: false, attributes: nil)
            }
            catch {
                print("Eroor, gick ej att skapa mapen")
            }
        }
    }
    
    //Skapar filen
    func saveFile(string fileContents:String) throws{
        do {
            try fileContents.writeToFile(fullyQualifiedPath, atomically: true, encoding: NSUTF8StringEncoding)
        }
        catch  {
            throw error
        }
    }
    
    
    //sparar filen
    func saveFile(dataForJson dataForJson:AnyObject) throws{
        do {
            let jsonData = try convertObjectToData(dataForJson) //convertera till json
            if !fileManager.createFileAtPath(fullyQualifiedPath, contents: jsonData, attributes: nil){
                throw FileErrors.FileNotSaved
            }
        } catch {
            print(error)
            throw FileErrors.FileNotSaved
        }
        
    }
    
    //Skapar JSON och sparar i fil
    private func convertObjectToData(data:AnyObject) throws -> NSData {
        
        do {
            
            let newData = try NSJSONSerialization.dataWithJSONObject(data, options: .PrettyPrinted)
            return newData
        }
        catch {
            print("Error writing data: \(error)")
        }
        throw FileErrors.JsonNotSerialized
    }
    
    
    // 1
    func getContentsOfFile() throws -> String {
        // 2
        guard fileExists else {
            throw FileErrors.FileNotFound
        }
        
        // 3
        var returnString:String
        do {
            returnString = try String(contentsOfFile: fullyQualifiedPath, encoding: NSUTF8StringEncoding)
        } catch {
            throw FileErrors.FileNotRead
        }
        // 4
        return returnString
    }
    
    //läser av filen
    func getJSONData() throws -> NSArray {
        
        guard fileExists else {
            throw FileErrors.FileNotFound
        }
        
        do {
            
            let data = try NSData(contentsOfFile: fullyQualifiedPath, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            
            let jsonArray = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! NSArray
            return jsonArray
        } catch {
            throw FileErrors.FileNotRead
        }
    }
    
    
}