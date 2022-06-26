//
//  MediumAppInfoView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import SwiftUI

struct MediumAppInfoView: View {
    @StateObject private var appInfo: AppInfo
    let index: Int

    init(appId: UUID, index: Int) {
        _appInfo = StateObject(wrappedValue: AppInfo(id: appId))
        self.index = index
    }

    var body: some View {
        VStack(spacing: 6) {
            HStack(spacing: 13) {
                RandomImage(cornerRadius: 20)
                    .frame(width: 90, height: 90)
                VStack(alignment: .leading, spacing: 6) {
                    Text(appInfo.name)
                        .font(.subheadline)
                    Text(appInfo.subName)
                        .font(.caption)
                        .foregroundColor(Color(.lightGray))
                    Spacer()
                    DownloadButtonStack(hasPurchase: appInfo.hasInternalPurchase,
                                        isBright: false,
                                        direction: .horizontal)
                }
                .frame(height: 84)
                Spacer()
            }

            if !index.isMultiple(of: 2) {
                HStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(Color(.systemGray5))
                        .frame(width: Constants.screenWidth - Constants.horizontalMargin * 2 - 103, height: 1)
                }
            }
        }
        .frame(width: Constants.screenWidth - 2 * Constants.horizontalMargin)
        .task {
            await appInfo.fetchInfo()
        }
    }
}

struct MediumAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MediumAppInfoView(appId: UUID(), index: 1).preferredColorScheme(.dark)
    }
}
