//
//  AppView+Extensions.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/28.
//

import SwiftUI

// MARK: first part
extension AppView {
    var firstPart: some View {
        VStack(spacing: 29) {
            VStack(spacing: 12) {
                Divider()
                    .padding(.horizontal, Constants.horizontalMargin)
                TopCardListView()
            }

            SectionTemplate(title: "무료 앱 순위", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 15, ranked: true, rowSize: .small)
            }

            SectionTemplate(title: "iPhone 필수 앱",
                            subTitle: "에디터가 엄선한 추천 앱들을 소개합니다",
                            hasSeeAllButton: true) {
                AppInfoListView(appsCount: 28, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "인기 앱", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 20, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "요즘 뜨는 앱", subTitle: "최근 인기 상승이 돋보이는 앱을 확인하세요.", hasSeeAllButton: true) {
                AppInfoListView(appsCount: 21, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "지금 감상하세요", subTitle: nil, hasSeeAllButton: false) {
                MediumCardListView()
            }

            SectionTemplate(title: "볼까, 들을까, 읽을까?", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 16, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "스타트업 앱으로 스타트하기", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 17, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "자유롭게 커스터마이징하세요", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 8, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "모두에게 사랑받는 앱",
                            subTitle: "꾸준한 인기를 누리고 있는 앱들을 만나보세요",
                            hasSeeAllButton: true) {
                AppInfoListView(appsCount: 23, ranked: false, rowSize: .small)
            }
        }
    }
}

// MARK: second part
extension AppView {
    var secondPart: some View {
        VStack(spacing: 29) {
            SectionTemplate(title: "놓치지 말아야 할 이벤트", subTitle: nil, hasSeeAllButton: false) {
                MediumCardListView()
            }

            SectionTemplate(title: "이번 주 주목해야 할 앱", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 22, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "사진에 레트로 감성 더하기", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 12, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "간편하게 숙소를 예약하세요", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 12, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "스트레스 없는 장보기", subTitle: "간편하게 주문하고 빠르게 받아보세요", hasSeeAllButton: true) {
                AppInfoListView(appsCount: 13, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "유료 앱 순위", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 15, ranked: true, rowSize: .small)
            }

            SectionTemplate(title: "마음을 돌보는 하루", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 13, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "아끼고, 모으고, 불리세요", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 15, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "필터로 마무리하세요", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 19, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "추천 이벤트", subTitle: nil, hasSeeAllButton: false) {
                MediumCardListView()
            }
        }
    }
}

// MARK: third part
extension AppView {
    var thirdPart: some View {
        VStack(spacing: 29) {
            SectionTemplate(title: "크리에이터를 위한 앱", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 11, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "아이에게 추천하는 앱", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 22, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "한 번 구독하고 가족과 함께 스세요", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 18, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "무료로 먼저 체험해보세요",
                            subTitle: "구독 시 무료 체험 기간을 제공하는 앱",
                            hasSeeAllButton: true) {
                AppInfoListView(appsCount: 29, ranked: false, rowSize: .small)
            }

            SectionTemplate(title: "Apple Watch 필수 앱", subTitle: nil, hasSeeAllButton: true) {
                AppInfoListView(appsCount: 20, ranked: false, rowSize: .small)
            }
        }
    }
}
