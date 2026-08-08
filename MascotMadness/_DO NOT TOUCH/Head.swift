import SwiftUI

struct Head<C: View>: BodyPart {
    
    @ViewBuilder
    var contentView: () -> C

    static var position: BodyPosition? {
        .head
    }
    
    var body: some View {
        contentView()
    }
}
