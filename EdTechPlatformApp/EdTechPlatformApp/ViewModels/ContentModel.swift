//
//  ContentModel.swift
//  EdTechPlatformApp
//
//  Created by Dhruv Ruttala on 2/27/23.
//

import Foundation

class ContentModel:ObservableObject{
    @Published var modules = [Module]()
    
    init(){
        func getLocalData(){
            let jsonUrl = Bundle.main.url
        }
    }
    
}
