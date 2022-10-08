//
//  Places.swift
//  JSONTest
//
//  Created by Zhao-Rong Lai on 2022/10/9.
//

import Foundation

struct Placess: Codable{
    var XML_Head: Places
    struct Places: Codable{
        var Listname: String
        var Infos: Place
        struct Place: Codable{
            var Info: [Point]
            struct Point: Codable{
//
                var Region: String?
//
                var Name: String
//
//                var Add: String
//
//                var Toldescribe: String
//
//                var Tel: String
//
            }
        }
    }
}
