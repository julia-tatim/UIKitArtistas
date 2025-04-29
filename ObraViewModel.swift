//
//  ObraViewModel.swift
//  UIKit Artistas Curitibanos
//
//  Created by user277135 on 4/27/25.
//


import UIKitclass ObraViewModel {    private var obras: [ObraDeArte]        init(obras: [ObraDeArte]) {        self.obras = obras    }        // Retorna o número de obras    func numberOfObras() -> Int {        return obras.count    }        // Retorna uma obra específica pelo índice    func obra(at index: Int) -> ObraDeArte {        return obras[index]    }        // Se você precisar modificar os dados no futuro, adicione mais métodos no ViewModel    func getObras() -> [ObraDeArte] {        return obras    }}