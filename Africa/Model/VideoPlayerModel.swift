//
//  VideoPlayerModel.swift
//  Africa
//
//  Created by ShreyGupta on 15/10/23.
//

import Foundation
import SwiftUI

class VideoPlayerModel : Codable, Identifiable {
    
    let id : String
    let name : String
    let headline : String
    
    var thumbnail : String {
        return "video-\(id)"
    }
    
}
