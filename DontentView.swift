import UIKit
import SwiftUI

struct DontentView: View {
    @State private var running=false
    
    var body: some View {
        VStack {
            Button(action: {
                running=true
                DispatchQueue.global().async {
                    // 在后台执行任务
                    sleep(2)
                    
                    // 返回主线程更新UI
                    DispatchQueue.main.async {
                        MainController()
                        running = false
                    }
                }
            }) {
                Text(running ? "running" : "click to run")
            }
        }
    }
    //    private func runTestProgram() -> Bool{return true}
}
