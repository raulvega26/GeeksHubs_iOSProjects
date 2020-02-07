//
//  PostDataProvider.swift
//  Christmapps
//
//  Created by user on 07/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import Foundation

protocol PostDataProvider {
    func sections() -> Int
    func rows(at index: Int) -> Int
    func row(at indexPath: IndexPath) -> Row
    func header(for section: Int) -> String?
    func footer(for section: Int) -> String?
}
