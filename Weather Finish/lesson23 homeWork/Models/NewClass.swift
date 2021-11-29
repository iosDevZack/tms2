//
//  NewClass.swift
//  lesson23 homeWork
//
//  Created by Женя  on 22.11.21.
//

import UIKit

struct Articles {
    var title: String?
    var description: String?
    var url: String?
}

struct News {
    var articles: [Articles] = []
}
