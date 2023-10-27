//
//  AnimalListItemModel.swift
//  Africa
//
//  Created by ShreyGupta on 13/08/23.
//

import SwiftUI

struct AnimalListItemModel : Codable, Identifiable {
    
    let id : String
    let name : String
    let headline : String
    let description : String
    let link : String
    let image : String
    let gallery : [String]
    let fact : [String]
   
}


