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
    
    var body: some View {
        List{
            ForEach(Array(dataManager.getList(Category: acCategory).enumerated()), id: \.offset) {idx, data in
                AccountRow(accountData: data)
            }
            // 수정중
            .onDelete { IndexSet in
               print("1")
            }
            //.padding()
            //.frame(maxWidth: .infinity)
            //.padding()
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
