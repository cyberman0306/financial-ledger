//
//  AccountData.swift
//  financial ledger
//
//  Created by cnu on 2023/01/31.
//

import Foundation

enum AccountCategory: String, CaseIterable, Codable {
    case none
    case saving
    case drink
    case food
    case transport
    
    var id:AccountCategory { self }  // 나자신의 메모리 주소를 id로 삼는것
    
    var DisplayImoji: String {
        switch self {
        case .saving: return "💰"
        case .drink: return "☕️"
        case .food: return "🥘"
        case .transport: return "🚘"
        default: return "💸"
        }
    }
    
    var Display: String {
        switch self {
        case .saving:
            return "돈아끼기좋은날"
        case .drink:
            return "마시기좋은날"
        case .food:
            return "먹기좋은날"
        case .transport:
            return "타고이동하기"
        default:
            return "돈아끼기좋은날"
        }
    }
    
}

class AccountData:Codable {
    
    var category:AccountCategory = .none
    var title: String = ""
    var account:String = "0"
    var date:Date = Date()
    
    init(category: AccountCategory, title: String, account: String) {
        self.category = category
        self.title = title
        self.account = account
    }
    init() {}
    
}


let DummyData: [AccountData] = [
    AccountData(category: .food, title: "저녁을 먹었음", account: "30,000"),
    AccountData(category: .saving, title: "올해 첫 저축", account: "100,000")
]
