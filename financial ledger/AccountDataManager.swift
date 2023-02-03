//
//  AccountDataManager.swift
//  financial ledger
//
//  Created by cnu on 2023/02/03.
//

import Foundation

class AccountDataManager: ObservableObject {
    static let ACCOUNT_DATA_LIST_KEY = "ACCOUNT_DATA_LIST_KEY"
    
    static let shared = AccountDataManager()
    
    @Published var acDataList:[AccountData] = []
    
    init() {
        if let data = UserDefaults.standard.value(forKey: AccountDataManager.ACCOUNT_DATA_LIST_KEY) as? Data {
            let accountList = try? PropertyListDecoder().decode([AccountData].self, from: data)
            if let list = accountList {
                acDataList = list
            }
        }
    }
    
    func getList(Category acCate:AccountCategory) -> [AccountData] {
        if acDataList.isEmpty {
            return getDummyData()
        }
        
        var returnList:[AccountData] = acDataList
        if acCate != .none {
            returnList = []
            for acData in acDataList {
                if acData.category == acCate {
                    returnList.append(acData)
                }
            }
        }
        
        return returnList
    }
    
    func getDummyData() -> [AccountData] {
        return [
            AccountData(category: .food, title: "저녁먹음", account: "30,000"),
            AccountData(category: .saving, title: "월급 저축", account: "100,000")
        ]
    }
    
    func add(AccountData acData:AccountData?) -> Bool {
        if let data = acData {
            acDataList.append(data)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(acDataList), forKey: AccountDataManager.ACCOUNT_DATA_LIST_KEY)
            
            return UserDefaults.standard.synchronize()
            
            
            
        }
        return false
    }
    
    // 수정중
//    func removeDataList() -> [AccountData] {
//
//        var returnList:[AccountData] = acDataList
//        return acDataList
        
        
}
