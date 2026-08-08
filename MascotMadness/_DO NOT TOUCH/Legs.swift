import SwiftUI

struct Legs<C: View>: BodyPart {
    
    static var position: BodyPosition? {
        .legs
    }
    
    @ViewBuilder
    var contentView: () -> C

    var body: some View {
        contentView()
    }
}
