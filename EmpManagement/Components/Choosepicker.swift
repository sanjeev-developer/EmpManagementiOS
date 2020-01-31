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

