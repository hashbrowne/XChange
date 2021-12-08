//
//  RateCell.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//
import UIKit

class RateCell: UITableViewCell, Bindable {
  
  typealias T = EquivalentRate
  
  @IBOutlet weak var codeLabel:UILabel!
  @IBOutlet weak var valueLabel:UILabel!
  @IBOutlet weak var containerView:UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    containerView.layer.cornerRadius = 5.0
    containerView.clipsToBounds = true
  }
  
  func bind(_ data: T) {
    codeLabel.text = data.currencyCode
    valueLabel.text = data.value?.stringValue
  }
}

