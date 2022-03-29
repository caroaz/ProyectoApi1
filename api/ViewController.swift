//
//  ViewController.swift
//  api
//
//  Created by Mobdev on 28-03-22.
//

import UIKit

//Modelo



class ViewController: UIViewController {
    
    var characterList :  [Character] = []
    

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    
        let anonymousFunction = { (fetchData: [Character]) in
            DispatchQueue.main.async {
                self.characterList = fetchData
            self.tableView.reloadData()
            }
//
        }
        miApi.shared.fetchData(onCompletion: anonymousFunction)
 
}
}
    


extension ViewController: UITableViewDataSource {
    
//    indica cuantas celdas queremos que tenga nuestra tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        if cell == nil {
         cell = UITableViewCell (style: .default, reuseIdentifier: "mycell")
           
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
        }
        let results =  characterList[indexPath.row]

        cell!.textLabel?.text = results.name
        return cell!
    }
}

//extension para que al dar tap, cambie el label
    
//    extension ViewController: UITableViewDelegate{
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////            print(myMovies[indexPath.row])
//            lableView.text = myMovies[indexPath.row]
//        }
//
//    }
//
    


