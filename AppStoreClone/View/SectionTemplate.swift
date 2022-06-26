//
//  SectionTemplate.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import SwiftUI

struct SectionTemplate<Content: View>: View {
    let title: String?
    let subTitle: String?
    let hasSeeAllButton: Bool
    let content: () -> Content

    var body: some View {
        VStack(spacing: 12) {
            Divider()
                .padding(.horizontal, Constants.horizontalMargin)
            if let title = title {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        if hasSeeAllButton {
                            NavigationLink("모두 보기") {
                                Text("Hello World!")
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
            }
            content()
        }
        .navigationBarHidden(true)
    }
}

struct SectionTemplate_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SectionTemplate(title: nil,
                            subTitle: nil,
                            hasSeeAllButton: false) {
                TopCardListView()
            }
            
        }
        .preferredColorScheme(.dark)
    }
}
