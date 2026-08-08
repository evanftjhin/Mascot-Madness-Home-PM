import SwiftUI

struct LeftArm<U: BodyPart, L: BodyPart>: BodyPart {
    static var position: BodyPosition? {
        nil
    }
    
    var upperArm: () -> U
    var foreArm: () -> L

    init(
        @ViewBuilder upperArm: @escaping () -> U,
        @ViewBuilder foreArm: @escaping () -> L
    ) {
        self.upperArm = upperArm
        self.foreArm = foreArm
    }

    var body: some View {
        VStack(spacing: 0) {
            upperArm()
            foreArm()
        }
    }
    
    func getSnapshot() -> [BodyPosition: UIImage] {
        upperArm().getSnapshot().merging(dict: foreArm().getSnapshot())
    }
}

struct RightArm<U: BodyPart, L: BodyPart>: BodyPart {
    static var position: BodyPosition? {
        nil
    }
    
    var upperArm: () -> U
    var foreArm: () -> L
    
    init(
        @ViewBuilder upperArm: @escaping () -> U,
        @ViewBuilder foreArm: @escaping () -> L
    ) {
        self.upperArm = upperArm
        self.foreArm = foreArm
    }
    
    var body: some View {
        VStack(spacing: 0) {
            upperArm()
            foreArm()
        }
    }
    
    func getSnapshot() -> [BodyPosition: UIImage] {
        upperArm().getSnapshot().merging(dict: foreArm().getSnapshot())
    }
}

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
    
    func merging(dict: [Key: Value]) -> [Key: Value] {
        var result = self
        result.merge(dict: dict)
        return result
    }
}
