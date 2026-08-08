import SwiftUI

var legs: some BodyPart {
    Legs {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.yellow)
        }
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 200)) {
    legs
}
