//
//  TranslationService.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2024/11/16.
//  Copyright © 2024 BN. All rights reserved.
//

import Foundation
import Speech
import Translation
import NaturalLanguage


class TranslationService {
  private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "zh-CN"))
  
  func speechTranslate(text: String, completion: @escaping (Result<String, Error>) -> Void) {
      
    let request = SFSpeechRecognitionRequest()
    request.shouldReportPartialResults = true

//    request.sourceSpeech = AVSpeechUtterance(string: text)
    
    speechRecognizer?.recognitionTask(with: request) { (result, error) in
      guard let translationResult = result else {
        completion(Result.failure(error!))
        return
      }
    
        let result = translationResult.transcriptions.first?.formattedString ?? "";
        
      completion(Result.success(result))
    }
  }
    
//    // 创建翻译请求
//    func translation(sourceLanguage: String = "en", targetLanguage: String = "zh-CN") -> Void {
//        // 创建翻译请求
//           let options: [String: Any] = [
////               "sourceLanguage": "en",
////               "targetLanguage": "zh-CN",
//            "sourceLanguage": sourceLanguage,
//            "targetLanguage": targetLanguage,
//           ]
//
//
//    }
}

