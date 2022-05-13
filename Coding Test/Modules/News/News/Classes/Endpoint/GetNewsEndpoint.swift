//
//  GetNewsEndpoint.swift
//  News
//
//  Created by Savvycom on 5/10/22.
//

import Support
import Constant

class GetNewsEndpoint: BaseAPI<ArticlesEntity> {
    override func path() -> String {
        return UrlConstant.kNewsEndpoint
    }
}
