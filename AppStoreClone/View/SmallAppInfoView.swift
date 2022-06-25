//
//  SmallAppInfoView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import SwiftUI

struct SmallAppInfoView: View {
    @StateObject private var appInfo: AppInfo
    let index: Int
    let ranked: Bool

    init(appId: UUID, index: Int, ranked: Bool) {
        _appInfo = StateObject(wrappedValue: AppInfo(id: appId))
        self.index = index
        self.ranked = ranked
    }

    var body: some View {
        VStack {
            HStack(spacing: 9) {
                RandomImage(cornerRadius: 12)
                .frame(width: 62, height: 62)

                HStack(spacing: 13) {
                    if ranked {
                        VStack(spacing: 6) {
                            Text("\(index)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text(" ")
                                .font(.caption)
                        }
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text(appInfo.name)
                            .font(.subheadline)
                        Text(appInfo.subName)
                            .font(.caption)
                            .foregroundColor(Color(.lightGray))
                    }
                }

                Spacer(minLength: 0)

                DownloadButton(hasPurchase: appInfo.hasInternalPurchase, isBright: false)
            }

            if !index.isMultiple(of: 3) {
                HStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(Color(.systemGray5))
                        .frame(width: Constants.screenWidth - Constants.horizontalMargin * 2 - 71, height: 1)
                }
            }
        }
        .frame(width: Constants.screenWidth - Constants.horizontalMargin * 2)
        .task {
            await appInfo.fetchInfo()
        }
    }
}

struct SmallAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SmallAppInfoView(appId: UUID(), index: 2, ranked: true).preferredColorScheme(.dark)
    }
}
