//
//  MediumCardView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/27.
//

import SwiftUI

struct MediumCardView: View {
    @StateObject private var appInfo: MediumCardAppInfo

    init(appId: UUID) {
        _appInfo = StateObject(wrappedValue: MediumCardAppInfo(id: appId))
    }

    var totalWidth: CGFloat {
        Constants.screenWidth - 2 * Constants.horizontalMargin
    }

    var totalHeight: CGFloat {
        Constants.screenHeight * (280 / 844)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(appInfo.topLabel)
                .font(.caption2)
                .foregroundColor(.blue)
            ZStack(alignment: .leading) {
                RandomImage(cornerRadius: 10)
                    .frame(width: totalWidth, height: totalHeight)
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        Spacer(minLength: 0)
                        Text(appInfo.upperLabel)
                            .font(.caption2)
                            .foregroundColor(Color(.lightGray))
                        Text(appInfo.midLabel)
                        Text(appInfo.lowerLabel)
                            .font(.caption2)
                            .foregroundColor(Color(.lightGray))
                            .padding(.bottom, 6)
                    }
                    .padding(.horizontal, 16)
                    ZStack {
                        Rectangle()
                            .frame(width: totalWidth, height: 60)
                            .foregroundColor(Color(.systemGray6))
                        HStack(spacing: 10) {
                            RandomImage(cornerRadius: 5)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(appInfo.name)
                                    .font(.caption)
                                Text(appInfo.subName)
                                    .font(.caption2)
                                    .foregroundColor(Color(.lightGray))
                                    .lineLimit(1)
                            }
                            Spacer(minLength: 0)
                            DownloadButtonStack(hasPurchase: appInfo.hasInternalPurchase,
                                                isBright: false,
                                                direction: .vertical)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .frame(width: totalWidth)
            }
            .frame(height: totalHeight)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .task {
                await appInfo.fetchInfo()
            }
        }
    }
}

struct MediumCardView_Previews: PreviewProvider {
    static var previews: some View {
        MediumCardView(appId: UUID()).preferredColorScheme(.dark)
    }
}
