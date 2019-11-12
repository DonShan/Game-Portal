//
//  GameDetailController.swift
//  Game Protal
//
//  Created by Madushan Senavirathna on 10/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import SDWebImage

class GameDetailController: UIViewController {
    
    var viewModel: GameDetailViewModel!
    
    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblName.text = self.viewModel.gameDetail.name
        self.lblDetail.attributedText = self.viewModel.gameDetail.description!.htmlToAttributedString
        if let url = self.viewModel.gameDetail.gbImage {
            self.imgGame.sd_setImage(with: URL(string: url))
        }
        
        let logButton : UIBarButtonItem = UIBarButtonItem(title: "Favorite", style: UIBarButtonItem.Style.plain, target: self, action: #selector(onFavorite))
        self.navigationItem.rightBarButtonItem = logButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func onFavorite() {
        PersistantStorage.shared.save(item: self.viewModel.gameSummary)
    }
    
    @IBAction func onReddit(_ sender: Any) {
        
        if let reddit = self.viewModel.gameDetail.redditUrl {
            UIApplication.shared.open(URL(string: reddit)!, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func onWebsite(_ sender: Any) {
        
        if let website = self.viewModel.gameDetail.website {
            UIApplication.shared.open(URL(string: website)!, options: [:], completionHandler: nil)
        }
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
