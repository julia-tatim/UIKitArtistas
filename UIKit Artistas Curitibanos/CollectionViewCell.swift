//
//  CollectionViewCell.swift
//  UIKit Artistas Curitibanos
//
//  Created by user275803 on 4/21/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var obraNomeLabel: UILabel!
    @IBOutlet weak var obraArtistaLabel: UILabel!
    @IBOutlet weak var obraImg: UIImageView!
    
    func setup(with obra: ObraDeArte) {
        let imagem = UIImage(named: obra.imagemNome)
        obraNomeLabel.text = obra.titulo
        obraArtistaLabel.text = obra.artista
        obraImg.image = imagem
    }
}
