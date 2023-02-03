//
//  InputAccountModal.swift
//  financial ledger
//
//  Created by cnu on 2023/01/31.
//

import SwiftUI

struct InputAccountModal: View {
    
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var money: String = ""
    @State private var memo: String = ""
    @State private var selectedCategory:AccountCategory = .none
    
    var dataManager:AccountDataManager = AccountDataManager.shared
    
    var TopButton:  some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
            }
            Spacer()
        }
        .padding()
    }
    
    var InputArea: some View {
        VStack {
            HStack {
                Text("얼마나 쓰셨나요")
                    .font(.title)
                Spacer()
                Button(action: {
                    let result = addAccountData()
                    isPresented = result
                    
                }) {
                    Image(systemName: "arrow.up")
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                }
            }
            TextField("금액 입력", text: $money)
                .keyboardType(.decimalPad)
                .font(.title)
            Text("")
            TextField("메모 입력", text: $memo)
                .font(.title)
            Picker("지출 종류", selection: $selectedCategory) {
                ForEach(AccountCategory.allCases, id: \.self) {
                    Category in Text(Category.DisplayImoji)
                        .tag(Category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Text("")
            HStack {
                Text("오늘은~")
                Spacer()
            }
            Text(selectedCategory.Display)
                .font(.title)
            Spacer()
        }
        .padding()
    }
    
    func addAccountData() -> Bool {
        let acData = AccountData(category: selectedCategory, title: memo, account: money)
        let result = dataManager.add(AccountData: acData)
        return !result
    }
    var body: some View {
        VStack(alignment: .leading) {
            TopButton
            InputArea
            Spacer()
        }.padding()
    }
}

struct InputAccountModal_Previews: PreviewProvider {
    static var previews: some View {
        InputAccountModal(isPresented: .constant(true))
        
    }
}
