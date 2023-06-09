//
//  DallEImageGenerator.swift
//  openaiplatform
//
//  Created by Dhruv Ruttala on 4/9/23.
//

import SwiftUI


class DallEImageGenerator {
    static let shared = DallEImageGenerator()
    private init() { }
    
    
    
    func generateImage(withPrompt prompt: String, apiKey: String) async throws -> ImageGenerationResponse {
        
        guard let url = URL(string: "https://api.openai.com/v1/images/generations") else {
            throw ImageError.badURL
        }
        
        let parameters: [String: Any] = [
            "prompt" : prompt,
            "n" : 1,
            "size" : "1024x1024",
        ]
        let data: Data = try JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = data
        let (response, _) = try await URLSession.shared.data(for: request)
        print(String(data: response, encoding: .utf8) ?? "No response data")
        let result = try JSONDecoder().decode(ImageGenerationResponse.self, from: response)
        
        return result
        
        
    }
}

enum ImageError: Error {
    
    case inValidPrompt, badURL
}
