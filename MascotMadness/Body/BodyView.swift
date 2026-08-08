import SwiftUI

var torso: some BodyPart {
    Torso {
        ZStack {
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height

                ZStack {
                    TorsoShape()
                        .fill(.white)

                    TorsoShape()
                        .fill(.red)
                        .mask {
                            Rectangle()
                                .frame(height: height / 2)
                                .frame(maxHeight: .infinity, alignment: .top)
                        }

                    Circle()
                        .fill(.white)
                        .frame(width: 46, height: 46)
                        .position(x: width * 0.38, y: height * 0.22)

                    Circle()
                        .fill(.red)
                        .frame(width: 46, height: 46)
                        .position(x: width * 0.38 + 14, y: height * 0.22 + 12)

                    ForEach(0..<5) { index in
                        let angle = Double(index) * 2 * Double.pi / 5 - Double.pi / 2
                        Image(systemName: "star.fill")
                            .font(.system(size: 14))
                            .foregroundStyle(.white)
                            .position(x: width * 0.58 + width * 0.13 * cos(angle),
                                      y: height * 0.24 + height * 0.10 * sin(angle))
                    }
                }
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 240)) {
    torso
}

struct TorsoShape: Shape {
    func path(in rect: CGRect) -> Path {
        let shoulders = rect.height * 0.55
        let waist = rect.height * 0.42
        let centerY = rect.midY

        var path = Path()
        path.move(to: CGPoint(x: rect.midX - shoulders / 2, y: rect.minY))
        path.addCurve(to: CGPoint(x: rect.midX + shoulders / 2, y: rect.minY),
                      control1: CGPoint(x: rect.midX - shoulders / 2, y: rect.minY),
                      control2: CGPoint(x: rect.midX + shoulders / 2, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX + waist / 2, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.midX - waist / 2, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX - 12, y: rect.maxY),
                      control2: CGPoint(x: rect.minX + 12, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
