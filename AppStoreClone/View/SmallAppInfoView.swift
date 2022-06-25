//
//  SmallAppInfoView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import SwiftUI

struct SmallAppInfoView: View {
    @StateObject private var appInfo: AppInfo
    let rank: Int?

    init(appId: UUID, rank: Int?) {
        _appInfo = StateObject(wrappedValue: AppInfo(id: appId))
        self.rank = rank
    }

    var body: some View {
        HStack(spacing: 9) {
            RandomImage(cornerRadius: 12)
            .frame(width: 62, height: 62)

            HStack(spacing: 13) {
                if let rank = self.rank {
                    VStack(spacing: 6) {
                        Text("\(rank)")
                            .font(.subheadline)
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

            DownloadButton(hasPurchase: appInfo.hasInternalPurchase)
        }
        .frame(width: Constants.screenWidth - Constants.horizontalMargin * 2)
        .task {
            await appInfo.fetchInfo()
        }
    }
}

struct SmallAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SmallAppInfoView(appId: UUID(), rank: nil).preferredColorScheme(.dark)
    }
}
