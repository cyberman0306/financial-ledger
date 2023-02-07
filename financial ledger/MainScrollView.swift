//
//  MainScrollView.swift
//  financial ledger
//
//  Created by cnu on 2023/01/31.
//

import SwiftUI

struct MainScrollView: View {
    
    @StateObject var dataManager: AccountDataManager = AccountDataManager.shared
    @State var acCategory: AccountCategory = .none
    @State var listItem: Array = []
    
    func deleteItem(at offsets: IndexSet) -> () {
        dataManager.acDataList.remove(atOffsets: offsets)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(dataManager.acDataList), forKey: AccountDataManager.ACCOUNT_DATA_LIST_KEY)
    }
    
    var body: some View {
        List{
            ForEach(Array(dataManager.getList(Category: acCategory).enumerated()), id:\.offset) {idx, data in
                AccountRow(accountData: data)
            }.onDelete(perform: deleteItem)
        }
        //.frame(width: .infinity)
        .background(.white)
        .cornerRadius(20)
        CategorySelectionArea(selectedCategory: $acCategory)
    }
}

struct CategorySelectionArea: View {
    @Binding var selectedCategory:AccountCategory
    var body: some View {
        VStack {
            Picker("지출종류를 골라주세요", selection: $selectedCategory) {
                ForEach(AccountCategory.allCases, id: \.self) { category in
                    Text(category.DisplayImoji).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .background(.white)
        .cornerRadius(20)
        .padding()
        
    }
    
    
}

struct MainScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MainScrollView()
    }
}
