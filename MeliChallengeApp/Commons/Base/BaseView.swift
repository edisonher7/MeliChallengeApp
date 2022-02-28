//
//  BaseView.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 20/02/22.
//

import Foundation

protocol BaseView {
    func openScreen(_ screen: Screen,
    fromStoryboard storyboard: Storyboard,
    withContext context: RouteContext?)

    func openChildScreen(_ screen: Screen,
    fromStoryboard storyboard: Storyboard,
    withContext context: RouteContext?)

    func backToPrevScreen(with context: RouteContext?)
}

