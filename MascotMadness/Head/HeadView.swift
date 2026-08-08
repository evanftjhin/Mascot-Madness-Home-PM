import SwiftUI

var head: some BodyPart {
    Head {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.yellow)
        }
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 200)) {
    head
}
