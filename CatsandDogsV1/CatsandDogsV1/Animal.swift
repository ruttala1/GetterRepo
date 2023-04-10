//
//  Animal.swift
//  CatsandDogsV1
//
//  Created by Dhruv Ruttala on 3/27/23.
//

import Foundation
//we will create a class called animals and store important feature related information inside it
class Animal {
    //url for the animal image
    var imgUrl: String
    //image data
    var imageData
    
    //creating an empty class of animal
    init(){
        self.imgUrl = ""
        self.imageData = nil
        
    } //end of init
    
    init(json:[String: Any]){
        //check if json has url
        guard let imageUrl = json["url"] as? String else {return nil}
        //set the animal property
        self.imgUrl = imageUrl
        self.imageData = nil
        
        //download img data
        getImage()
        
    }//end of json init
    
}
