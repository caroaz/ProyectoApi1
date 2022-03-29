

import UIKit


class ViewController: UIViewController {
    
    var characterList :  [Character] = []
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let anonymousFunction = { (fetchData: [Character]) in
            //            Dispatchqueue nos permite una app más rapida, con menos bloqueos  y mejor experiencia de usuario
            //            main: es el thread principal de la app, y podemos acceder a el desde cualquier punto de la app
            DispatchQueue.main.async {
                self.characterList = fetchData
                //                reloadData, recarga las filas y secciones de la vista de la tabla
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
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (characterList[indexPath.row].status) == "Alive"{
            let vcAlive = storyboard?.instantiateViewController(withIdentifier: "AliveViewController") as! AliveViewController
            let results =  characterList[indexPath.row]
            vcAlive.dataName = results.name
            vcAlive.statusData = results.status
            vcAlive.speciesData = results.species
            vcAlive.genderData = results.gender
            
            navigationController?.pushViewController(vcAlive, animated: true)
        }else if  (characterList[indexPath.row].status) == "Dead" {
            let vcDead = storyboard?.instantiateViewController(withIdentifier: "DeadViewController") as! DeadViewController
            let results =  characterList[indexPath.row]
            vcDead.dataName = results.name
            vcDead.statusData = results.status
            vcDead.speciesData = results.species
            vcDead.genderData = results.gender
            
            
            print (characterList[indexPath.row])
            navigationController?.pushViewController(vcDead, animated: true)
            
        }else if  (characterList[indexPath.row].status) == "unknown"{
            let vcUnknown = storyboard?.instantiateViewController(withIdentifier: "UnknownViewController") as! UnknownViewController
            let results =  characterList[indexPath.row]
            vcUnknown .dataName = results.name
            vcUnknown .statusData = results.status
            vcUnknown .speciesData = results.species
            vcUnknown.genderData = results.gender
            
            
            print (characterList[indexPath.row])
            navigationController?.pushViewController(vcUnknown, animated: true)
        }
    }
}
