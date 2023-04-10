//
//  Bundle-Decodable.swift
//  TapStore
//
//  Created by Paul Hudson on 01/10/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

public extension Bundle {
    func decodeNew<T: Decodable>(_ filename: String, cb: ((JSONDecoder) -> Void)? = nil) -> T {
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("Failed to locate \(filename) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(url) from bundle.")
        }

        let decoder = JSONDecoder()
        cb?(decoder)
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(filename) from bundle.")
        }

        return loaded
    }

    func decode<T: Decodable>(_ type: T.Type, from filename: String, cb: ((JSONDecoder) -> Void)? = nil) -> T {
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("Failed to locate \(filename) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(url) from bundle.")
        }

        let decoder = JSONDecoder()
        cb?(decoder)
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(filename) from bundle.")
        }

        return loaded
    }
}
