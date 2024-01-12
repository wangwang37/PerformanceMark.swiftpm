//
//  performancetestprogram.swift
//  PerformanceMark
//
//  Created by bob zhou on 2024/1/7.
//

import Foundation
import CryptoKit

public func multiplyMatrices() -> String? {
    // Check if the matrices can be multiplied
    let matrixA = (0..<100).map { _ in (0..<100).map { _ in Int.random(in: 1...10) } }
    let matrixB = (0..<100).map { _ in (0..<100).map { _ in Int.random(in: 1...10) } }
    guard matrixA[0].count == matrixB.count else {
        print("Error: Number of columns in matrixA must be equal to the number of rows in matrixB.")
        return nil
    }
    var result = Array(repeating: Array(repeating: 0, count: matrixB[0].count), count: matrixA.count)
    for i in 0..<matrixA.count {
        for j in 0..<matrixB[0].count {
            for k in 0..<matrixB.count {
                result[i][j] += matrixA[i][k] * matrixB[k][j]
            }
        }
    }
    var res = ""
    for row in result {
            let rowString = row.map { String($0) }.joined(separator: " ")
            res += rowString + "\n"
        }

    return res
}

public func multiplyab() ->String?{
    var res = 0
    for _ in 0..<1_000_000 {
        res = Int.random(in: 1...100) * Int.random(in: 1...100)
    }
    return String(res)
}

public func sha256() -> String {
    let defaultString = UUID().uuidString
    guard let inputData = defaultString.data(using: .utf8)else {return ""}
    let hashed = SHA256.hash(data: inputData)
    return hashed.map { String(format: "%02x", $0) }.joined()
}

