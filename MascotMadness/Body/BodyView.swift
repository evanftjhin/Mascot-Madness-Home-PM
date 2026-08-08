import SwiftUI

var torso: some BodyPart {
    Torso {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.green)
        }
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 200)) {
    torso
}
