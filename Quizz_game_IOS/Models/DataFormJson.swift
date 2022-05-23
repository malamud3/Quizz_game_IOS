//
//  DataFormJson.swift
//  Quizz_game_IOS
//
//  Created by Amir Malamud on 23/05/2022.
//

import Foundation
import UIKit
public class DataFromJson{
    

private func parse(jsonData: Data) {
    do {
        let decodedData = try JSONDecoder().decode(Question.self, from: jsonData)
        print(decodedData.answers)
        print(decodedData.imgUrl)
        print(decodedData.rightAnswer)
    
    }
    catch {
            print("decode error")
        }
}
    
    func setData(dataURL:String)
 {
        loadJson(fromURLString: dataURL) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                print(error)
            }
    }
     
     
 func loadJson(fromURLString urlString: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
    if let url = URL(string: urlString) {
        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        
        urlSession.resume()
    }
  }
 }
}
    

