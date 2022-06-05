//
//  LanguageObject.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class LanguageObject {
    
    static var shared = LanguageObject()
    
    var locale: String = Constants.Keys.turkishLocalization
}
