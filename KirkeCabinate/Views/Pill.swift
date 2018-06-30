//
//  Pill.swift
//  KirkeCabinate
//
//  Created by John Pavley on 6/27/18.
//  Copyright © 2018 John Pavley. All rights reserved.
//

import UIKit

@IBDesignable
class Pill: UIView {
    
    enum PillState {
        case ready, taken, missed
    }
    
    var state: PillState = .ready
    
    let canvasSize: CGFloat = 240.0
    
    func calcScaleFactor(viewWidth: CGFloat) -> CGFloat {
        let scaleFactor: CGFloat = viewWidth/canvasSize
        return scaleFactor
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawBody()
        drawState()
    }
    
    func drawBody() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        
        let scaleFactor: CGFloat = calcScaleFactor(viewWidth: self.bounds.width)
        ctx.scaleBy(x: scaleFactor, y: scaleFactor)
        
        /*  Shape   */
        let pathRef = CGMutablePath()
        pathRef.move(to: CGPoint(x: 120, y: 228))
        pathRef.addCurve(to: CGPoint(x: 12, y: 120), control1: CGPoint(x: 60.353, y: 228), control2: CGPoint(x: 12, y: 179.647))
        pathRef.addCurve(to: CGPoint(x: 120, y: 12), control1: CGPoint(x: 12, y: 60.353), control2: CGPoint(x: 60.353, y: 12))
        pathRef.addCurve(to: CGPoint(x: 228, y: 120), control1: CGPoint(x: 179.647, y: 12), control2: CGPoint(x: 228, y: 60.353))
        pathRef.addCurve(to: CGPoint(x: 120, y: 228), control1: CGPoint(x: 228, y: 179.647), control2: CGPoint(x: 179.647, y: 228))
        pathRef.closeSubpath()
        
        ctx.setFillColor(red: 0.949, green: 0.827, blue: 0, alpha: 1)
        ctx.addPath(pathRef)
        ctx.fillPath()
        
        ctx.setLineWidth(8)
        ctx.setStrokeColor(red: 0.667, green: 0.58, blue: 0, alpha: 1)
        ctx.addPath(pathRef)
        ctx.strokePath()
    }
    
    func drawReady() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        
        /*  Shape   */
        let pathRef = CGMutablePath()
        pathRef.move(to: CGPoint(x: 84, y: 72))
        pathRef.addLine(to: CGPoint(x: 156, y: 72))
        pathRef.addCurve(to: CGPoint(x: 168, y: 84), control1: CGPoint(x: 162.627, y: 72), control2: CGPoint(x: 168, y: 77.373))
        pathRef.addLine(to: CGPoint(x: 168, y: 156))
        pathRef.addCurve(to: CGPoint(x: 156, y: 168), control1: CGPoint(x: 168, y: 162.627), control2: CGPoint(x: 162.627, y: 168))
        pathRef.addLine(to: CGPoint(x: 84, y: 168))
        pathRef.addCurve(to: CGPoint(x: 72, y: 156), control1: CGPoint(x: 77.373, y: 168), control2: CGPoint(x: 72, y: 162.627))
        pathRef.addLine(to: CGPoint(x: 72, y: 84))
        pathRef.addCurve(to: CGPoint(x: 84, y: 72), control1: CGPoint(x: 72, y: 77.373), control2: CGPoint(x: 77.373, y: 72))
        pathRef.closeSubpath()
        
        ctx.setFillColor(red: 0.812, green: 0.706, blue: 0, alpha: 1)
        ctx.addPath(pathRef)
        ctx.fillPath()
    }
    
    func drawTaken() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        
        /*  Shape   */
        let pathRef = CGMutablePath()
        pathRef.move(to: CGPoint(x: 84, y: 132))
        pathRef.addLine(to: CGPoint(x: 108, y: 156))
        
        ctx.setLineWidth(20)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0.196, green: 0.651, blue: 0, alpha: 1)
        ctx.addPath(pathRef)
        ctx.strokePath()
        
        
        /*  Shape 2  */
        let pathRef2 = CGMutablePath()
        pathRef2.move(to: CGPoint(x: 156, y: 84))
        pathRef2.addLine(to: CGPoint(x: 108, y: 156))
        
        ctx.setLineWidth(20)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0.196, green: 0.651, blue: 0, alpha: 1)
        ctx.addPath(pathRef2)
        ctx.strokePath()
    }
    
    func drawMissed() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        
        /*  Shape   */
        let pathRef = CGMutablePath()
        pathRef.move(to: CGPoint(x: 84, y: 84))
        pathRef.addLine(to: CGPoint(x: 156, y: 156))
        
        ctx.setLineWidth(20)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0.82, green: 0.114, blue: 0, alpha: 1)
        ctx.addPath(pathRef)
        ctx.strokePath()
        
        
        /*  Shape 2  */
        let pathRef2 = CGMutablePath()
        pathRef2.move(to: CGPoint(x: 156, y: 84))
        pathRef2.addLine(to: CGPoint(x: 84, y: 156))
        
        ctx.setLineWidth(20)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0.82, green: 0.114, blue: 0, alpha: 1)
        ctx.addPath(pathRef2)
        ctx.strokePath()
    }
    
    func drawState() {
        switch state {
        case .ready:
            drawReady()
        case .taken:
            drawTaken()
        case .missed:
            drawMissed()
        }
    }

}
