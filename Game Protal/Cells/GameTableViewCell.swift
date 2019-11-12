//
//  GameTableViewCell.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import SDWebImage

class GameTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMeta: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setGameObject(gameObject: GameSummary) {
        lblName.text = gameObject.name
        lblMeta.text = "\(gameObject.metacritic ?? 0)"
        if let img = gameObject.backgroundImage {
            imgGame.sd_setImage(with: URL(string: img))
        }
        let names = gameObject.genres.compactMap({$0.name ?? ""})
        self.lblGenre.text = names.joined(separator: ", ")
    }
    
}
