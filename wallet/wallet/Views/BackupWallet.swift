//
//  BackupWallet.swift
//  wallet
//
//  Created by Francisco Gindre on 12/30/19.
//  Copyright © 2019 Francisco Gindre. All rights reserved.
//

import SwiftUI

struct BackupWallet: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
    }
    
    let itemSpacing: CGFloat = 24
    let buttonPadding: CGFloat = 40
    let buttonHeight: CGFloat = 58
     @State private var showModal: Bool = false
    var body: some View {
        
        ZStack {
            
            Color.black
            
            VStack(alignment: .center, spacing: itemSpacing) {
                Spacer()
                ZcashLogo()
                Spacer()
                Text("92% Synced")
                Spacer()
                Button(action: {
                     self.showModal = true
                }) {
                    ZcashButton(color: Color.black, fill: Color.zYellow, text: "Backup Wallet")
                        .frame(height: buttonHeight)
                }
                .padding([.leading, .trailing], buttonPadding)
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Restore")
                        .foregroundColor(Color.zYellow)
                        .font(.body)
                        .frame(height: buttonHeight)
                }
                .padding([.leading, .trailing], buttonPadding)
                Spacer()
            }
        }
    .navigationBarTitle(Text(""))
    .navigationBarHidden(true)
    .sheet(isPresented: self.$showModal) {
        SeedBackup(words: FakeProvider().seedWords(limit: 16))
    }
    }
}

struct BackupWallet_Previews: PreviewProvider {
    static var previews: some View {
        BackupWallet()
    }
}


protocol SeedWordsProvider {
    func seedWords(limit: Int) -> [String]
}

struct FakeProvider: SeedWordsProvider {}
extension SeedWordsProvider {
    func seedWords(limit: Int) -> [String] {
        ["volume", "burst", "illegal", "swap", "neck", "brother", "foil", "gain", "thought", "glass", "unfold", "mercy", "kangaroo", "faculty", "divorce"]
    }
}
