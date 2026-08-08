import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @State private var url: URL?
    
    var body: some View {
        VStack {
            if let url {
                ShareLink(item: url)
            }
        }
        .onAppear {
            let data = Content(head: head,
                               leftArm: leftArm,
                               rightArm: rightArm,
                               legs: legs,
                               torso: torso).data()
            
            let url = URL.temporaryDirectory.appendingPathComponent(UUID().uuidString)
            
            try! data.write(to: url)
            self.url = url
        }
    }
}

struct Content: Codable {
    var head: Data
    var leftUpperArm: Data
    var rightUpperArm: Data
    var rightLowerArm: Data
    var leftLowerArm: Data
    var legs: Data
    var torso: Data
    
    init(head: any BodyPart,
         leftArm: any BodyPart,
         rightArm: any BodyPart,
         legs: any BodyPart,
         torso: any BodyPart) {
        self.head = head.getSnapshot()[.head]!.pngData()!
        self.leftUpperArm = leftArm.getSnapshot()[.leftUpperArm]!.pngData()!
        self.leftLowerArm = leftArm.getSnapshot()[.leftLowerArm]!.pngData()!
        self.rightUpperArm = rightArm.getSnapshot()[.rightUpperArm]!.pngData()!
        self.rightLowerArm = rightArm.getSnapshot()[.rightLowerArm]!.pngData()!
        self.legs = legs.getSnapshot()[.legs]!.pngData()!
        self.torso = torso.getSnapshot()[.torso]!.pngData()!
    }
    
    func data() -> Data {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(self)
        return data
    }
}

#Preview {
    ContentView()
}
