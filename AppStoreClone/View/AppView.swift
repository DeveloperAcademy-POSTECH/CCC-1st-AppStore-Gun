//
//  AppView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/27.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 29) {
                    firstPart
                    secondPart
                    thirdPart
                }
            }
            .navigationTitle("앱")
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
        .preferredColorScheme(.dark)
    }
}
