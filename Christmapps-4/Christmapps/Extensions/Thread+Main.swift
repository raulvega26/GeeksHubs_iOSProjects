//
//  Thread+Main.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 09/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import Foundation

extension Thread {
    static func executeInMain(_ block: @escaping () -> Void) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { block() }
            return
        }
        block()
    }
}
