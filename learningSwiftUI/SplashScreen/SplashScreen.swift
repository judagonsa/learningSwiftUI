//
//  SplashScreen.swift
//  learningSwiftUI
//
//  Created by Julian González on 15/05/24.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    @Environment(AppData.self) private var appData
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        Rectangle()
            .fill(.black)
            .overlay {
                if let jsonUrl {
                    LottieView {
                        await LottieAnimation.loadedFrom(url: jsonUrl)
                    }
                    .playing(.fromProgress(0, toProgress: progress, loopMode: .playOnce))
                    .animationDidFinish{ completed in
                        appData.isSplashFinish = progress != 0 && completed
                    }
                    .frame(width: 600, height: 400)
                    .task {
                        try? await Task.sleep(for: .seconds(0.15))
                        progress = 0.8
                    }
                }
            }
            .ignoresSafeArea()
    }
    
    private var jsonUrl: URL? {
        if let bundlePath = Bundle.main.path(forResource: "netflixSplash", ofType: "json") {
            return URL(filePath: bundlePath)
        }
        return nil
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
