//
//  Airport.swift
//  Assigment2
//
//  Created by CHI on 2021/4/14.
//

import Foundation

struct Airport: Decodable {
    var name: String // 機場名稱
    var country: String // 國家
    var IATA: String // 識別碼
    var imageName: String // 圖片名稱
    var servedCity: String // 城市
    var shortName: String // 簡稱
}
