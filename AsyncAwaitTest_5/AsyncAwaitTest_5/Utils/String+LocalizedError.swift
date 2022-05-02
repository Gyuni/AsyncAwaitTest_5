//
//  String+LocalizedError.swift
//  AsyncAwaitTest_5
//
//  Created by gyuni on 2022/05/03.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
