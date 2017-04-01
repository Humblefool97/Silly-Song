//
//  LyricsUtils.swift
//  Silly Song
//
//  Created by Rajeev Kr on 29/03/17.
//  Copyright © 2017 Rajeev Kr. All rights reserved.
//

import Foundation

class LyricsUtils{
    private static let lyricsTemplate =  ["<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
                                                "Banana Fana Fo F<SHORT_NAME>",
                                                "Me My Mo M<SHORT_NAME>",
                                                "<FULL_NAME>"].joined(separator: "\n")
    
     static func  shortNameFromName(name: String) -> String {
        let newName = name.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        
        let vowels = "aeiou"
        let nameInCharset = CharacterSet(charactersIn: vowels)
        if let startIndex = newName.lowercased().rangeOfCharacter(from: nameInCharset)?.lowerBound{
            
            return  name.substring(from:startIndex).lowercased()
        }
        return ""
    }
    
   
    public static func lyricsForName(fullName: String) -> String {
        let shortName = shortNameFromName(name:fullName)
        let fullNameFormat = "<FULL_NAME>"
        let shortNameFormat = "<SHORT_NAME>"
        
        if(shortName != ""){
            
            let lyrics = lyricsTemplate
                .replacingOccurrences(of: fullNameFormat, with: fullName, options: .caseInsensitive, range: nil)
                .replacingOccurrences(of: shortNameFormat, with: shortName, options: .caseInsensitive, range: nil)
            return lyrics
        }
        
        
        
        return ""
    }

}
