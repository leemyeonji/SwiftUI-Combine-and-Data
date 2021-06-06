//
//  CertificatesCard.swift
//  SwiftUICombineAndData
//
//  Created by 임현지 on 2021/06/06.
//

import SwiftUI

struct CertificatesCard: View {
    @EnvironmentObject var certificatesVM: CertificateViewModel
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            Image("CertificateBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
            if certificatesVM.certificates.count > 0 {
                content
            } else {
                Text("No certificates")
            }        
        }
        .frame(maxWidth: 725, maxHeight: 465)
        .background(RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9921568627, green: 0.2470588235, blue: 0.2, alpha: 0.8)).opacity(0.8), Color(#colorLiteral(red: 0.2980392157, green: 0, blue: 0.7843137255, alpha: 0.6)).opacity(0.2)]), center: .bottomTrailing, startRadius: 5, endRadius: 900))
        .overlay(RoundedRectangle(cornerRadius: 30.0, style: .continuous).stroke(Color.white).blendMode(.overlay))
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)).opacity(0.5), radius: 30, x: 0, y: 15)
    }
    
    var content: some View {
        VStack(spacing: 20) {
            Image(certificatesVM.certificates[selection].logo)
                .resizable()
                .frame(width: 28, height: 28)
                .padding(8)
                .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                .mask(Circle())
                .background(Circle().stroke(Color.white.opacity(0.4), lineWidth: 0.5))
            
            Section {
                Text("Certificate of completion")
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color.white)
                Text("this is to certify that")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
            }
            .textCase(.uppercase)
            
            Text("Lee Myeonji")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Successfully completed the online course \(certificatesVM.certificates[selection].course) on \(certificatesVM.certificates[selection].date)")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: 250)
                .fixedSize(horizontal: false, vertical: true)
            
            Section {
                Divider()
                instructorRow
                Divider()
                certificatesDataRow
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .foregroundColor(.white.opacity(0.7))
            .padding(.horizontal, 20)
        }
    }
    
    var instructorRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Design+Code Instructor")
            Text("\(certificatesVM.certificates[selection].instructor)")
        }
    }
    
    var certificatesDataRow: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Certificate no: DC-\(certificatesVM.certificates[selection].id)")
            Text("Certificate url: designcode.io/certificate/\(certificatesVM.certificates[selection].id)")
        }
    }
}

struct CertificatesCard_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesCard(selection: Binding.constant(0))
            .environmentObject(CertificateViewModel())
    }
}
