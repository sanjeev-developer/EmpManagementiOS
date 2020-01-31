//
//  Choosepicker.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-15.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import Foundation
import UIKit

protocol ToolbarPickerViewDelegate: class {
    func didTapDone()
    func didTapCancel()
}

class ToolbarPickerView: UIPickerView {

public private(set) var toolbar: UIToolbar?
public weak var toolbarDelegate: ToolbarPickerViewDelegate?

override init(frame: CGRect) {
    super.init(frame: frame)
    self.commonInit()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.commonInit()
}
private func commonInit() {
let toolBar = UIToolbar()
toolBar.barStyle = UIBarStyle.default
toolBar.isTranslucent = true
toolBar.tintColor = .black
toolBar.sizeToFit()

let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped))
let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
