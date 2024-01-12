import SwiftUI

struct ContentView: View {
    @State private var running: Bool = false
    @State private var computationTime: Double?
    @State private var result: String?
    @State private var batteryLevelBefore: Float?
    @State private var batteryLevelAfter: Float?

    var body: some View {
        VStack {
            Spacer()

            Button(action: {
                runTestProgram()
            }) {
                Text(running ? "运行中" : "开始运行")
            }
            .padding()

            if let res = result {
                Text("\(res)").padding()
            }
            if let time = computationTime {
                Text("Computation Time: \(time, specifier: "%.2f") seconds")
                    .padding()
            }

            if let batteryBefore = batteryLevelBefore,
               let batteryAfter = batteryLevelAfter {
                Text("Battery Level Change: \(batteryBefore * 100)% → \(batteryAfter * 100)%")
                    .padding()
            }

            Spacer()
        }
    }

    private func runTestProgram() {
        guard !running else { return }
        
        running = true
        batteryLevelBefore = UIDevice.current.batteryLevel

        DispatchQueue.global(qos: .background).async {
            let startTime = Date()

//            for _ in 0...1000000 {
//                result = sha256()
//            }
            for _ in 0...100000 {
                result = multiplyMatrices()
            }

            let endTime = Date()
            DispatchQueue.main.async {
                computationTime = endTime.timeIntervalSince(startTime)
                running = false
                batteryLevelAfter = UIDevice.current.batteryLevel
            }
        }
    }
}
