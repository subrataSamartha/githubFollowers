//
//  ErrorMessageModel.swift
//  githubFollowers
//
//  Created by subrata Samartha on 08/05/23.
//

import Foundation

enum ErrorMessage: String {
    case invalidURLString = "Invalid URL String"
    case invalidURLRequest = "Invalid URL Request, Something bad happend"
    case invalidHTTPResponse = "Invalid HTTP Request"
    case InvalidData = "Invalid Data"
    case invalidDecoding = "Error while decoding the data"
}
