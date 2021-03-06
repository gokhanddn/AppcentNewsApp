//
//  NetworkError.swift
//  Networking
//
//  Created by GOKHAN on 4.06.2022.
//

import Foundation

public enum NetworkError: Error {
    case requestFailed
    case invalidData
    case responseUnsuccessful
    case jsonConversionFailure
    case invalidURL
}
