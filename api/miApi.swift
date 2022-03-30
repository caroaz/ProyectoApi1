//
//  miApi.swift
//  api
//
//  Created by Mobdev on 28-03-22.
//

import Foundation
import UIKit
final class miApi {
    
    static let shared = miApi()
    //    func que obtenga los datos de la api()
    func fetchData(onCompletion: @escaping ( [Character]?, APIError?) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
        //        hacer un task (tarea) para guardar datos
        let task = URLSession.shared.dataTask(with: url){
            //            cuando tenga los datos los almacenara en la variable data,el error en variable error y si hay un codigo de respuesta en response
            (data, response, error ) in
            
            
            
            
            
            
            guard let data = data else {
                onCompletion(nil, APIError(message: "Invalid model"))
                return}
            // ejecutara el codigo en esta sección y retornara error si no se puede decodoficar
            guard  let characterList = try? JSONDecoder().decode(CharacterList.self, from: data) else {
                onCompletion(nil, APIError(message: "Invalid request"))
                
    
                
                return
            }// con self indica que es un tipo de objeto, no es algo que estoy creando
         
            onCompletion(characterList.results, nil)
            
            
        }
        task.resume()
    }
}
struct Character:  Codable {
    
    // indica que es estructura si es codificable
    let identifier:  Int
    let name : String
    let species: String
    let status: String
    let gender: String
    let image: String
    
    
    enum CodingKeys: String,  CodingKey{
        case identifier = "id"
        case  name
        case species
        case status
        case gender
        case image
    }
    
}

struct CharacterImage: Codable{
    let image : String
}
struct CharacterList: Codable{
    let results: [Character]
}


struct APIError {
    let message: String
}

