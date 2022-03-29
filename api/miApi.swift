//
//  miApi.swift
//  api
//
//  Created by Mobdev on 28-03-22.
//

import Foundation
final class miApi {
    
    static let shared = miApi()
//    func que obtenga los datos de la api()
    func fetchData(onCompletion: @escaping ( [Character] ) -> () ) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
//        hacer un task (tarea) para guardar datos
        let task = URLSession.shared.dataTask(with: url){
//            cuando tenga los datos los almacenara en la variable data,el error en variable error y si hay un codigo de respuesta en response
            (data, response, error ) in
            guard let data = data else {
                print("datos son nulos")
                return}
            // ejecutara el codigo en esta sección y retornara error si no se puede decodoficar
            guard  let characterList = try? JSONDecoder().decode(CharacterList.self, from: data)  else {
                print ("no se puede decodificar")
                return
            }// con self indica que es un tipo de objeto, no es algo que estoy creando
          
            onCompletion(characterList.results)
        
            
        }
        task.resume()
    }
}
struct Character:  Codable { // indica que es estructura si es codificable
    let id: Int
    let name : String
    let species: String
    let status: String
    let gender: String
}

struct CharacterList: Codable{
    let results: [Character]
}
