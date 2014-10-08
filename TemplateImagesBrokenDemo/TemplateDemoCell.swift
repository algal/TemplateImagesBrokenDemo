//
//  TemplateDemoCell.swift
//  TemplateImagesBrokenDemo
//
//  Created by Alexis Gallagher on 2014-10-08.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

class TemplateDemoCell: UITableViewCell {
  
  @IBOutlet weak var buttonView: UIButton!
  @IBOutlet weak var templateImageView: UIImageView!
  
  class func classReuseIdentifier() -> NSString  { return "cellReuseIdentifier" }

    override func awakeFromNib() {
      super.awakeFromNib()
      
      if shouldSetImagesManually {
        // the following three-lines should have no effect.
        // but in fact, they ensure that the UIImageView
        // correctly applies its tintColor to the vector template image
        
        let image = self.templateImageView.image
        self.templateImageView.image = nil
        self.templateImageView.image = image
      }
    }
}
