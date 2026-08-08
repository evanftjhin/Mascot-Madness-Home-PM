import SwiftUI

struct Torso<C: View>: BodyPart {
    
    @ViewBuilder
    var contentView: () -> C
    
    static var position: BodyPosition? {
        .torso
    }

    var body: some View {
        contentView()
    }
}
