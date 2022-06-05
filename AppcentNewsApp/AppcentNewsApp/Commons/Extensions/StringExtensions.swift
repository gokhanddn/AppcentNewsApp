//
//  StringExtensions.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation

extension String {
    
    func localized(_ lang: String) -> String {

        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
