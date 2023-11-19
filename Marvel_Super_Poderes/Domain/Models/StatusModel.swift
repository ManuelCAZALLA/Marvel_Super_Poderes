//
//  StatusModel.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 11/11/23.
//

import Foundation

enum Status {
    case none
    case loaded
    case loading
    case loadingSeries
    case error(error: String)
}
