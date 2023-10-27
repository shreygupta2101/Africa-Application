//
//  CodableBundleExtention.swift
//  Africa
//
//  Created by ShreyGupta on 13/08/23.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> [T] {
        
        //MARK: Doubt
        guard let url = self.url(forResource: file, withExtension: nil) else {
            
            fatalError("Fatal error not able to locate the json file: \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fatal error failed to recive data from file: \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode([T].self, from: data) else {
            fatalError("data not found from file: \(file)")
        }
        
        return decodedData
    }
}
