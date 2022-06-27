//
//  SectionTemplate.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import SwiftUI

struct SectionTemplate<Content: View>: View {
    let title: String
    let subTitle: String?
    let hasSeeAllButton: Bool
    let content: () -> Content

    var body: some View {
        VStack(spacing: 12) {
            Divider()
                .padding(.horizontal, Constants.horizontalMargin)
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                    if hasSeeAllButton {
                        Button("모두 보기") {
                        }
                    }
                }

                if let subTitle = subTitle {
                    Text(subTitle)
                        .font(.caption)
                        .foregroundColor(Color(.lightGray))
                        .padding(.bottom, 3)
                }
            }
            .padding(.horizontal, Constants.horizontalMargin)
            content()
        }
    }
}

struct SectionTemplate_Previews: PreviewProvider {
    static var previews: some View {
        SectionTemplate(title: "무료 앱 순위",
                        subTitle: nil,
                        hasSeeAllButton: true) {
            AppInfoListView(appsCount: 15, ranked: true, rowSize: .small)
        }
        .preferredColorScheme(.dark)
    }
}
