import SwiftUI

struct LeftUpperArmSegment<V: View>: BodyPart {
    
    static var position: BodyPosition? {
        .leftUpperArm
    }
    
    @ViewBuilder
    var contentView: () -> V
    
    var body: some View {
        contentView()
    }
}

struct LeftLowerArmSegment<V: View>: BodyPart {
    
    static var position: BodyPosition? {
        .leftLowerArm
    }
    
    @ViewBuilder
    var contentView: () -> V
    
    var body: some View {
        contentView()
    }
}


struct RightUpperArmSegment<V: View>: BodyPart {
    
    static var position: BodyPosition? {
        .rightUpperArm
    }
    
    @ViewBuilder
    var contentView: () -> V
    
    var body: some View {
        contentView()
    }
}

struct RightLowerArmSegment<V: View>: BodyPart {
    
    static var position: BodyPosition? {
        .rightLowerArm
    }
    
    @ViewBuilder
    var contentView: () -> V
    
    var body: some View {
        contentView()
    }
}
