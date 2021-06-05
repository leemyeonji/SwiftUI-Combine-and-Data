//
//  FAQ.swift
//  SwiftUICombineAndData
//
//  Created by 임현지 on 2021/06/05.
//

import Foundation

struct FAQ: Decodable, Identifiable {
    var id: Int
    var question: String
    var answer: String
}
