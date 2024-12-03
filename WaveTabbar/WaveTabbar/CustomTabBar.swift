//
//  CustomTabBar.swift
//  WaveTabbar
//
//  Created by Kavya Krishna K. on 03/12/24.
//

import UIKit

class CustomTabBar: UITabBar {
    private let waveLayer = CAShapeLayer()
    private let dotView = UIView()
    private let dotRadius: CGFloat = 16.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWaveLayer()
        setupDotView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWaveLayer()
        setupDotView()
    }

    private func setupWaveLayer() {
        waveLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(waveLayer)
    }

    private func setupDotView() {
        dotView.backgroundColor = .black
        dotView.layer.cornerRadius = dotRadius / 2
        dotView.clipsToBounds = true

        // Initial Frame
        dotView.frame = CGRect(x: bounds.width / 2 - dotRadius / 2, y: -dotRadius, width: dotRadius, height: dotRadius)

        addSubview(dotView)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Update the wave and dot
        updateWaveAndDot()

        // Ensure the dotView is above all other subviews
        bringSubviewToFront(dotView)
    }


    func updateWaveAndDot() {
        guard let items = items, items.count > 0 else { return }

        // Calculate the center of the selected tab
        let tabWidth = bounds.width / CGFloat(items.count)
        let selectedIndex = selectedItemIndex()
        let centerX = tabWidth * CGFloat(selectedIndex) + tabWidth / 2

        // Wave customization
        let waveHeight: CGFloat = 20 // Height of the downward curve
        let waveWidth: CGFloat = 60 // Width of the wave

        // Create the wave shape path
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0)) // Start from the left
        path.addLine(to: CGPoint(x: centerX - waveWidth, y: 0))

        // Add curve
        path.addQuadCurve(
            to: CGPoint(x: centerX + waveWidth, y: 0),
            controlPoint: CGPoint(x: centerX, y: waveHeight)
        )

        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height))
        path.close()

        // Update the wave layer
        waveLayer.path = path.cgPath

        // Update the dot position (center of the tab and slightly above the bar)
        dotView.center = CGPoint(x: centerX, y: -dotRadius / 2)

        // Debugging: Print dotView position
        print("DotView Center: \(dotView.center)")
    }


    private func selectedItemIndex() -> Int {
        return items?.firstIndex(of: selectedItem ?? items?.first ?? UITabBarItem()) ?? 0
    }
}


import UIKit

class CustomTabBar1: UITabBar {
    
    private var waveLayer: CAShapeLayer!
    private var dotView: UIView!
    private let waveHeight: CGFloat = 20
    private let dotRadius: CGFloat = 8
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if waveLayer == nil {
            setupWaveLayer()
        }
        
        if dotView == nil {
            setupDotView()
        }
        
        updateWaveAndDot()
    }
    
    private func setupWaveLayer() {
        waveLayer = CAShapeLayer()
        waveLayer.fillColor = UIColor.systemBlue.cgColor
        layer.addSublayer(waveLayer)
    }
    
    private func setupDotView() {
        dotView = UIView(frame: CGRect(x: 0, y: 0, width: dotRadius * 2, height: dotRadius * 2))
        dotView.backgroundColor = .systemBlue
        dotView.layer.cornerRadius = dotRadius
        dotView.layer.masksToBounds = true
        addSubview(dotView)
    }
    
    private func updateWaveAndDot() {
        guard let items = items, items.count > 0 else { return }
        
        // Calculate the center of the selected tab
        let tabWidth = bounds.width / CGFloat(items.count)
        let selectedIndex = selectedItemIndex()
        let centerX = tabWidth * CGFloat(selectedIndex) + tabWidth / 2
        
        // Update the wave shape
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centerX - 30, y: 0))
        path.addQuadCurve(to: CGPoint(x: centerX + 30, y: 0),
                          controlPoint: CGPoint(x: centerX, y: -waveHeight))
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height))
        path.close()
        
        waveLayer.path = path.cgPath
        
        // Update the dot position
        dotView.center = CGPoint(x: centerX, y: -dotRadius)
    }
    
    private func selectedItemIndex() -> Int {
        return items?.firstIndex(of: selectedItem!) ?? 0
    }
}
