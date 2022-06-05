//
//  ArticleSourceView.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import SwiftUI

struct ArticleSourceView: View {
    var sourceUrl: String
    
    var body: some View {
        VStack {
            if let url = URL(string: sourceUrl) {
                ArticleWebView(url: url)
            } else {
                Text(sourceUrl)
            }
        }
    }
}

struct ArticleSourceView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleSourceView(sourceUrl: String())
    }
}
