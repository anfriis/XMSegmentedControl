//
//  ViewController.swift
//  XMSegmentedControl
//
//  Created by Anders Friis on 06/10/2017.
//  Copyright © 2017 Cromian. All rights reserved.
//

import UIKit
import XMSegmentedControl

class ViewController: UIViewController {

	@IBOutlet weak var containerView: UIView!
	
	lazy var segmentedControl: XMSegmentedControl = {
		let unselectedCol = UIColor.gray
		let selectedCol = UIColor.red
		
		let strings = ["FIRST", "SECOND"]
		
		let attributedTitles = strings.map({
			return NSAttributedString(string: $0, attributes: [
				NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14),
				NSAttributedStringKey.kern: 1.4
				])
		})
		
		let seg = XMSegmentedControl(frame: containerView.bounds, segmentAttributedTitles: attributedTitles, selectedItemHighlightStyle: XMSelectedItemHighlightStyle.bottomEdge)
		
		seg.backgroundColor = .white
		seg.tint = unselectedCol
		seg.highlightColor = selectedCol
		seg.highlightTint = selectedCol
		seg.edgeHighlightHeight = 2
		seg.translatesAutoresizingMaskIntoConstraints = false
		return seg
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
	}

	var hasLayedOutSubviews = false
	
	override func viewDidLayoutSubviews() {
		if !hasLayedOutSubviews {
			hasLayedOutSubviews = true
			
			self.view.layoutIfNeeded()
			
			containerView.addSubview(segmentedControl)
		}
	}
	

}

