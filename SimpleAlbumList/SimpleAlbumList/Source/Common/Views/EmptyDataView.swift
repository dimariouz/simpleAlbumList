//
//  EmptyDataView.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit

final class EmptyDataView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet weak private var bgView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var reloadButton: UIButton!
    
    private let bgCornerRadius: CGFloat = 10
    
    var reloadButtonClosure: Closure<Void>?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.roundCorners(radius: bgCornerRadius)
        bgView.addShadow()
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed(EmptyDataView.reuseIdentifier, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.text = "no_results".localized
        reloadButton.setTitle("reload".localized, for: .normal)
    }
    
    @IBAction private func reloadButtonAction(_ sender: UIButton) {
        reloadButtonClosure?(())
    }
    
}
