//
//  NewUIViewController.swift
//  SwiftUI(WithUIViewController)
//
//  Created by master on 2019/10/23.
//  Copyright © 2019 ksb. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class SharedData : ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var switchOn : Bool = Bool() { willSet { objectWillChange.send() } }
}

class NewUIViewController : UIViewController {
    
    // 여기에 선언을 해주면 EnvironmentObject가 선언되지 않았다는 에러가 발생한다.
//    @EnvironmentObject var state : SharedData
    
    
    @IBOutlet weak var simpleSwitch: UISwitch!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        simpleSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
        
//        UIHostingController(
    }
    
    @objc func stateChanged(switchState: UISwitch) {
        if switchState.isOn {
            
            state.switchOn = true
            self.view.backgroundColor = UIColor.init(red: 225/255, green: 195/255, blue: 0/255, alpha: 1.0)
            
        } else {
            
            state.switchOn = false
            self.view.backgroundColor = UIColor.white
            
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
       let viewController = UIHostingController(rootView: ContentView())
        self.present(viewController,animated: true, completion: nil)
    }
    
}


/// UIViewControllerRepresentable 프로토콜을 준수하는 struct를 만들어서
/// SwiftUI View hierarchy에 포함하도록 UIViewController를 구현해줌
struct NewView : UIViewControllerRepresentable {
    
    @EnvironmentObject var state : SharedData
    
    // 필수
    typealias UIViewControllerType = NewUIViewController
    
    // 필수
    func makeUIViewController(context: UIViewControllerRepresentableContext<NewView>) -> NewUIViewController {
        return NewUIViewController()
    }
    
    // 필수
    func updateUIViewController(_ uiViewController: NewUIViewController, context: UIViewControllerRepresentableContext<NewView>) {
        
    }
    
}

#if DEBUG
let state = SharedData()

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView().environmentObject(state)
    }
}
#endif
