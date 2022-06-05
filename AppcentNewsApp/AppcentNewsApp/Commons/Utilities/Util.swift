//
//  Util.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation

final class Util {
    static func getReadableDate(strDate: String, style: DateFormatter.Style = .full) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let locReadable = Locale(identifier: LanguageObject.shared.locale)
        let formatterReadable = DateFormatter()
        formatterReadable.locale = locReadable
        formatterReadable.dateStyle = style
        
        if let date = dateFormatter.date(from: strDate) {
            return formatterReadable.string(from: date)
        }
        
        return String()
    }
}
