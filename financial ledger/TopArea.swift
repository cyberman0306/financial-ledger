//
//  TopView.swift
//  financial ledger
//
//  Created by cnu on 2023/01/31.
//

import SwiftUI

struct TopArea: View {
    @State private var isShowModal = false
    
    var body: some View {
        HStack {
            Button {
                self.isShowModal = true
            } label: {
                Text("💸💸💸")
                    .font(.system(size: 33.3))
                    .frame(maxWidth:.infinity)
            }
            .padding()
            .sheet(isPresented: self.$isShowModal) {
                InputAccountModal(isPresented: self.$isShowModal)
            }

        }
        .background(.white)
        .cornerRadius(20)
        .padding()
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopArea()
    }
}
