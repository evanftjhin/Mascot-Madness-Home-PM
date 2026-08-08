import SwiftUI

var rightArm: some BodyPart {
    RightArm {
        RightUpperArmSegment {
            ZStack {
                Rectangle()
                    .frame(width: 30, height: 200)
                    .foregroundStyle(.orange)
            }
        }
    } foreArm: {
        RightLowerArmSegment {
            ZStack {
                Rectangle()
                    .frame(width: 30, height: 200)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 200)) {
    rightArm
}
