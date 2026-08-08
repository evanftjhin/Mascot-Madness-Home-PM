//
//  BodyPart.swift
//  MyApp
//
//  Created by Jia Chen Yee on 8/7/26.
//

import Foundation
import SwiftUI

protocol BodyPart: View {
    func getSnapshot() -> [BodyPosition: UIImage]
    
    static var position: BodyPosition? { get }
}

extension BodyPart {
    func getSnapshot() -> [BodyPosition: UIImage] {
        let renderer = ImageRenderer(content: body)
        if let uiImage = renderer.uiImage {
            return [Self.position!: uiImage]
        }
        return [:]
    }
}

enum BodyPosition: Hashable {
    case head, leftUpperArm, rightUpperArm, rightLowerArm, leftLowerArm, legs, torso
}
