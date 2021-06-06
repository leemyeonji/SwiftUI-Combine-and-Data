//
//  CertificatesView.swift
//  SwiftUICombineAndData
//
//  Created by 임현지 on 2021/06/06.
//

import SwiftUI

struct CertificatesView: View {
    
    @StateObject var certificateVM = CertificateViewModel()
    
    var body: some View {
        VStack {
            ForEach(certificateVM.certificates, id: (\.id)) {
                certificate in
                CertificatesCard(certificates: certificate)
            }
        }
        .background(AccountBackground())
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
