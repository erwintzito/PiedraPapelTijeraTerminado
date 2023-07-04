//
//  Sign.swift
//  PiedraPapelTijera
//
//  Created by Erwin Bermudez Casillas on 03/07/23.
//

import Foundation


func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .piedra
    }else if sign == 1 {
        return .papel
    }else {
        return .tijera
    }
}

enum Sign{
    case piedra
    case papel
    case tijera
    
    var emoji: String {
        switch self {
        case .piedra:
            return "👊🏻"
        case .papel:
            return "🖐🏻"
        case .tijera:
            return "✌🏻"
        }
    }
}
