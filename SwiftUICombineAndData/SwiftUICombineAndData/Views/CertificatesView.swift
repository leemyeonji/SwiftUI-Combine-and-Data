//
//  CertificatesView.swift
//  SwiftUICombineAndData
//
//  Created by 임현지 on 2021/06/06.
//

import SwiftUI

struct CertificatesView: View {
    
    @StateObject var certificateVM = CertificateViewModel()
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(certificateVM.certificates.indices, id: (\.self)) {
                certificate in
                CertificatesCard(selection: $selection)
                    .padding(.horizontal, 8)
                    .environmentObject(certificateVM)
            }
        }
        .background(AccountBackground())
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
