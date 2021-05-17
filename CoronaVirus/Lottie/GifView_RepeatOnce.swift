//
//  GifView_RepeatOnce_RepeatOnce.swift
//  CoronaVirus
//
//  Created by Milovan on 25.04.2021.
//

import SwiftUI
import Lottie

struct GifView_RepeatOnce: UIViewRepresentable {
    typealias UIViewType = UIView
    var imagine : String
    
    func makeUIView(context: UIViewRepresentableContext<GifView_RepeatOnce>) -> UIView {
        
        let view = UIView(frame: .zero)
        let animationView = AnimationView()
        let animation = Animation.named(imagine)
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play(fromProgress: 0, toProgress: 1, loopMode: LottieLoopMode.playOnce, completion: {_ in })
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GifView_RepeatOnce>) {
                
    }
}
