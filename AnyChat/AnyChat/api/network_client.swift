//
//  network_client.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 28/04/2022.
//
import UIKit

class NetworkClient: NSObject {
    static let shared = NetworkClient()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://xxx.com/"
    private let appUrl = baseURL + "app.xxx/xxx"
    
    private override init(){}
    
    func getMessages(completed: @escaping (Result<[Message], APError>) -> Void) {
        guard let url = URL(string: appUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidData))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MessageResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task .resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
