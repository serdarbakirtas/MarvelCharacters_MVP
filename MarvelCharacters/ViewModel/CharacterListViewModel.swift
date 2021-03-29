//
//  CharacterListViewModel.swift
//  MarvelCharacters
//
//  Created by Hasan on 27.03.21.
//

import Foundation
import UIKit

struct CharacterListViewModel {
    
    var name: String?
    
    init(from items: CharacterList) {
        name = getCharacterName(items: items)
    }
        
    func getCharacterName(items: CharacterList) -> String {
        return items.name
    }
}
