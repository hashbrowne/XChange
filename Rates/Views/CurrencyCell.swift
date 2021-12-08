//
//  CurrencyCell.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//

import UIKit

class CurrencyCell: UITableViewCell, Bindable{
  
  typealias T = Currency
  
  @IBOutlet weak var codeLabel:UILabel!
  @IBOutlet weak var nameLabel:UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func bind(_ data:T) {
    codeLabel.text = data.code
    nameLabel.text = data.name
  }
}

