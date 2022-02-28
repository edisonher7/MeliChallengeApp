//
//  BasePresenter.swift
//  MeliChallengeApp
//
//  Created by Edison Camilo Herrera Roldan on 20/02/22.
//

import Foundation
import RxSwift

class BasePresenter<V> {

    var baseView: V?
    var context: RouteContext?

    func attachView(baseView: V) {
        self.baseView = baseView
    }

    func setContext(to context: RouteContext?) {
        self.context = context
    }

    func detachView() {
        baseView = nil
    }
}
