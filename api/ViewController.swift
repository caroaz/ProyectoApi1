

import UIKit


class ViewController: UIViewController {
    
    var characterList :  [Character] = []
    
    var tableView = UITableView ()
    
    
    struct Cells{
        static let mycell = "my cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        configureTableView()
        
        miApi.shared.fetchData { characters, error in
            
            DispatchQueue.main.async {
                guard let characters = characters else {
                    print(error?.message ?? "error")
                    return
                }
                self.characterList = characters
                self.tableView.reloadData()
            }
        }
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(MyCell.self, forCellReuseIdentifier: Cells.mycell)
        tableView.pin(to :view)
        
    }
    func setTableViewDelegates(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}



//
extension ViewController: UITableViewDataSource {
    
    //    indica cuantas celdas queremos que tenga nuestra tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return characterList.count
        
        //        print(characterList)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:Cells.mycell) as! MyCell
        let results =  characterList[indexPath.row]
        cell.set(results: results)
        return cell
    }
}



extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vcDetail = DetailTableView()
        vcDetail.dataContent = characterList[indexPath.row]


        navigationController?.pushViewController(vcDetail, animated: true)
    }
}
