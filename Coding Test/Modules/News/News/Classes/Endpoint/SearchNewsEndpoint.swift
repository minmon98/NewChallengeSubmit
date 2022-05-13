//
//  SearchNewsEndpoint.swift
//  Pods
//
//  Created by Savvycom on 11/05/2022.
//

import Support
import Constant

class SearchNewsEndpoint: BaseAPI<ArticlesEntity> {
    private var query = ""
    
    init(query: String) {
        self.query = query
    }
    
    override func path() -> String {
        return String(format: UrlConstant.kSearchNewsEndpoint, query)
    }
}
