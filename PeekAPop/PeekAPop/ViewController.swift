//
//  ViewController.swift
//  PeekAPop
//
//  Created by Lyvennitha on 05/03/21.
//

import UIKit

class ViewController: UIViewController/*, UIContextMenuInteractionDelegate*/ {
    
    @IBOutlet weak var tableView: UITableView!
    
   // var interaction: UIContextMenuInteraction?//UIContextMenuInteraction(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //interaction = UIContextMenuInteraction(delegate: self)
        
        // Do any additional setup after loading the view.
    }
    
//    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { suggestedActions in
//            return self.makeContextMenu()
//        })
//    }
//
//    func makeContextMenu() -> UIMenu {
//
//        var themeVal = ""
//
//        // Create a UIAction for sharing
//        let dark = UIAction(title: "DARK MODE", image: UIImage(systemName: "square.and.arrow.up")) { action in
//            // Show system share sheet
//            themeVal = "dark"
//            self.changeTheme(themeVal: themeVal)
//        }
//
//        let light = UIAction(title: "LIGHT MODE", image: UIImage(systemName: "square.and.arrow.up")) { action in
//            // Show system share sheet
//            themeVal = "light"
//            self.changeTheme(themeVal: themeVal)
//        }
//
//
//        // Create and return a UIMenu with the share action
//        return UIMenu(title: "MODE", children: [dark, light])
//    }
//
//    func changeTheme(themeVal: String){
//        if #available(iOS 13.0, *) {
//             switch (themeVal) {
//             case "dark":
//                self.view?.overrideUserInterfaceStyle = .dark
//                 break
//             case "light":
//                self.view?.overrideUserInterfaceStyle = .light
//                 break
//             default:
//                self.view?.overrideUserInterfaceStyle = .unspecified
//             }
//          }
//    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.addInteraction(self.interaction!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions -> UIMenu? in
            let action = UIAction(title: "Dark Mode", image: nil, identifier: .none) { action in
                // Put button handler here
                self.view?.overrideUserInterfaceStyle = .dark
            }
            
            let action2 = UIAction(title: "Light Mode", image: nil, identifier: .none) { action in
                // Put button handler here
                self.view?.overrideUserInterfaceStyle = .light
            }
            return UIMenu.init(title: "SELECT MODE", children: [action, action2])
        }
        return configuration
    }
}
