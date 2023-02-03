//
//  ContentView.swift
//  financial ledger
//
//  Created by cnu on 2023/01/31.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
                .opacity(0.2)
            
            VStack {
                TopArea()
                Spacer()
                MainScrollView()
                Spacer()
                BottomArea()
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
