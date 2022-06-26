//
//  DownloadButton.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import SwiftUI

enum DownloadButtonStackDirection {
    case vertical, horizontal
}

struct DownloadButtonStack: View {
    let hasPurchase: Bool
    let isBright: Bool
    let direction: DownloadButtonStackDirection

    var downloadButton: some View {
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
    }

    var internalPurchaseText: some View {
        Text("앱 내 구입")
            .font(.system(size: 9))
            .foregroundColor(isBright ? .white : .gray)
    }

    var body: some View {
        Group {
            switch direction {
            case .vertical:
                VStack(spacing: 5) {
                    downloadButton
                    if hasPurchase {
                        internalPurchaseText
                    }
                }
            case .horizontal:
                HStack(spacing: 7) {
                    downloadButton
                    if hasPurchase {
                        internalPurchaseText
                    }
                }
            }
        }
    }
}

struct DownloadButton_Previews: PreviewProvider {
    static var previews: some View {
        DownloadButtonStack(hasPurchase: true, isBright: false, direction: .horizontal)
            .preferredColorScheme(.dark)
    }
}
