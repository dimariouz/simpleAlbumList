//
//  NetworkService.swift
//  SimpleAlbumList
//
//  Created by mac on 10.02.2021.
//

import UIKit
import Alamofire

protocol NetworkServiceProtocol: class {
    func get<T: Codable>(host: String,
                         path: String, parameters: Parameters?,
                         headers: [String: String],
                         encoding: ParameterEncoding,
                         completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkServiceProtocol {
    
    func get<T: Codable>(host: String = Constants.APIs.host, path: String, parameters: Parameters? = nil, headers: [String: String] = [:], encoding: ParameterEncoding = JSONEncoding.default, completion: @escaping (Result<T, Error>) -> Void) {
        get(host: host, path: path, parameters: parameters, headers: headers, encoding: encoding, completion: completion)
    }
    
}

enum Result<Value, Error> {
    case success(Value)
    case failure(Error)
}

final class NetworkService: NetworkServiceProtocol {
    
    func get<T: Codable>(host: String,
                         path: String,
                         parameters: Parameters?,
                         headers: [String: String],
                         encoding: ParameterEncoding,
                         completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(host + path, method: .get, parameters: parameters, encoding: encoding, headers: HTTPHeaders(headers)).validate().responseJSON { response in
            self.handleResponse(response, completion: completion)
        }
    }
    
}

extension NetworkService {
    
    private func handleResponse<T: Codable>(_ response: AFDataResponse<Any>, completion: @escaping (Result<T, Error>) -> Void) {
        switch response.result {
        case .success(let value):
            self.handleSuccess(value: value, completion: completion)
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    private func handleSuccess<T: Codable>(value: Any, completion: @escaping (Result<T, Error>) -> Void) {
        if let data = try? JSONSerialization.data(withJSONObject: value, options: []),
           let object = try? JSONDecoder().decode(T.self, from: data) {
            completion(.success(object))
        } else {
            let error = NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "decoding_fail".localized])
            completion(.failure(error))
        }
    }
    
}
