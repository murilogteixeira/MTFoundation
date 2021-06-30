//
//  UIImage+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 29/06/21.
//

import UIKit

public extension UIImage {
     private enum URLLoaderError: Error, LocalizedError {
         case downloadError, conversionError

         var errorDescription: String? {
             switch self {
             case .downloadError: return "Não foi possível baixar a imagem."
             case .conversionError: return "Não foi possível converter os dados em imagem."
             }
         }
     }

     static func load(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
         DispatchQueue.main.async {
             do {
                 let data = try Data(contentsOf: url)
                 guard let image = UIImage(data: data) else {
                     completion(.failure(URLLoaderError.conversionError))
                     return
                 }
                 completion(.success(image))
             } catch {
                 completion(.failure(URLLoaderError.downloadError))
             }
         }
     }
 }
