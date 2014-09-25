//
//  ViewController.swift
//  TemplateImagesBrokenDemo
//
//  Created by Alexis Gallagher on 2014-09-24.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  // header
  var myHeaderView:UIView?

  override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if self.myHeaderView == nil {
      self.myHeaderView = UINib(nibName: "HeaderView", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView
    }
    return self.myHeaderView
  }

  override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(250)
  }
  
  // cell
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cellReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
    
    
    return cell
  }

}

