//
//  DownloadButton.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import SwiftUI

struct DownloadButton: View {
    let hasPurchase: Bool
    let isBright: Bool

    var body: some View {
        VStack(spacing: 5) {
            Button {
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor((isBright ? Color.white : .gray).opacity(0.5))
                    Text("받기")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(isBright ? .white : .blue)
                }
                .frame(width: 74, height: 29)
            }
            if hasPurchase {
                Text("앱 내 구입")
                    .font(.system(size: 9))
                    .foregroundColor(isBright ? .white : .gray)
            }
        }
    }
}

struct DownloadButton_Previews: PreviewProvider {
    static var previews: some View {
        DownloadButton(hasPurchase: true, isBright: false)
            .preferredColorScheme(.dark)
    }
}
