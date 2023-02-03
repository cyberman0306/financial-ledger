//
//  AccountRow.swift
//  financial ledger
//
//  Created by cnu on 2023/01/31.
//

import SwiftUI

func numberFormat(price:String) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    if let intValue = Int(price) {
        let num = NSNumber(value: intValue)
        if let result = numberFormatter.string(from: num) {
            return result
        }
    }
    
    return price
}

struct AccountRow: View {
    
    var accountData:AccountData
    
    var buttonArea: some View {
        VStack {
            Button {
                
            } label: {
                Text("+")
                    .foregroundColor(.black)
            }
            .frame(width: 43, height: 33)
            .background(Color("AccountAdd"))
        .cornerRadius(10)
        }
        .padding()
    }
    
    var body: some View {
        HStack {
            // 로고자리
            Text(accountData.category.DisplayImoji)
                .font(.system(size: 45))
                .cornerRadius(0.3)
            VStack {
                Text(accountData.title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(numberFormat(price: accountData.account) + "원")
                    .font(.title3)
            }
            Spacer()
            buttonArea
        }
        .padding()
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow(accountData: DummyData.first!)
    }
}
