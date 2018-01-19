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
	
	// Segmented control with highlight color and
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
	
	// Segmented Control with rounded corners
	lazy var segmentedControl2: XMSegmentedControl = {
		let unselectedCol = UIColor.gray
		let selectedCol = UIColor.red
		
		let strings = ["FIRST", "SECOND"]
		
		let attributedTitles = strings.map({
			return NSAttributedString(string: $0, attributes: [
				NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14),
				NSAttributedStringKey.kern: 1.4
				])
		})
		
		let seg = XMSegmentedControl(frame: CGRect.zero, segmentAttributedTitles: attributedTitles, selectedItemHighlightStyle: XMSelectedItemHighlightStyle.background)
		
		seg.backgroundColor = .white
		seg.cornerRadius = 4
		seg.tint = unselectedCol
		seg.highlightColor = UIColor.white
		seg.highlightTint = selectedCol
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
			
			self.view.addSubview(segmentedControl2)
			
			segmentedControl2.translatesAutoresizingMaskIntoConstraints = false
			
			NSLayoutConstraint.activate([
				segmentedControl2.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 30),
				segmentedControl2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
				segmentedControl2.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
				segmentedControl2.heightAnchor.constraint(equalToConstant: 50.0)
				])
		
			segmentedControl2.update()
		}
	}
	
	
}

