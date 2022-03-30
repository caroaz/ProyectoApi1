

import UIKit


class ViewController: UIViewController {
    
    var characterList :  [Character] = []
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        miApi.shared.fetchData { characters, error in
                    DispatchQueue.main.async {
                        guard let characters = characters else {
                            print(error?.message)
                            return
                        }
                        self.characterList = characters
                        self.tableView.reloadData()
                    }
                }
        
    }
}

//            //            Dispatchqueue nos permite una app más rapida, con menos bloqueos  y mejor experiencia de usuario
//            //            main: es el thread principal de la app, y podemos acceder a el desde cualquier punto de la app

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
        switch results.status {
                case "Alive":
                   cell?.contentView.backgroundColor = .green
                case "Dead":
                    cell?.contentView.backgroundColor = .red
                default:
                    cell?.contentView.backgroundColor = .lightGray
                }
        return cell!
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vcDetails = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let results =  characterList[indexPath.row]
        vcDetails.dataName = results.name
        vcDetails.statusData = results.status
        vcDetails.speciesData = results.species
        vcDetails.genderData = results.gender
        vcDetails.imageData = results.image
       
        
    
        navigationController?.pushViewController(vcDetails, animated: true)
    }
}
