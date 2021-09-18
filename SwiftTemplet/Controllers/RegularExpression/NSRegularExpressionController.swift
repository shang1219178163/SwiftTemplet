//
//  NSRegularExpressionController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/9/15.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NSRegularExpressionController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        test1()
//        test2()
//        test3()
        test4()
    }

    
    func test() {
        do {
            let input = "My name is Taylor Swift"
            let regex = try NSRegularExpression(pattern: "My name is (.*)", options: .caseInsensitive)
            let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))

            matches.forEach { match in
                let range = match.range(at:1)
                if let swiftRange = Range(range, in: input) {
                    let name = input[swiftRange]
                    DDLog(name)
                    DDLog("\(match.numberOfRanges)_\(name)")
                }
            }
        } catch {
            // regex was bad!
        }
    }
    
    func test1() {
//        let input = "My name is Taylor, My name is Swift"
        let input = "My name is 泰勒, My name is 斯威夫特"

//        let regex = try? NSRegularExpression(pattern: "My name is (.*)", options: .caseInsensitive)
        let regex = try? NSRegularExpression(pattern:"[^\\u4E00-\\u9FA5]+", options: .caseInsensitive)

        guard let regex = regex else {
            DDLog("正则表达式初始化异常")
            return }
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        let value = matches.map { match in
            guard let swiftRange = Range(match.range, in: input) else {
                return ""}
            return String(input[swiftRange])
        }.joined(separator: "")
        DDLog(value)
        
        
//        if let match = matches.first {
//            let range = match.range(at:1)
//            if let swiftRange = Range(range, in: input) {
//                let name = input[swiftRange]
//                DDLog(name)
//            }
//        }
        
        matches.forEach { match in
            if let swiftRange = Range(match.range, in: input) {
                DDLog("\(match.range)_\(input[swiftRange])")
            }
        }
        
        regex.enumerateMatches(in: input, options: .reportCompletion, range: NSMakeRange(0, input.count)) { result, flags, objBool in
            guard let matchRange = result?.range else { return }
            let value = input.substring(with: matchRange)
            DDLog(matchRange, value)
        }
    }
    
    func test2() {
//        let input = "My name is Taylor, My name is Swift"
        let input = "123tian333xia456tian33xiauu3uuutia33nxia";

//        let pattern = "My name is (.*)"
        let pattern = "[a-zA-Z]+"
        
        guard let regex = try? NSRegularExpression(pattern:NSRegularExpression.Pattern.alphabet.rawValue, options: .caseInsensitive) else {
            return }
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
//        let value = matches.map { match in
//            guard let swiftRange = Range(match.range, in: input) else {
//                return ""}
//            return String(input[swiftRange])
//        }.joined(separator: "")
//        DDLog(value)
        
        matches.forEach { match in
            DDLog("\(match.range)_\(input[Range(match.range, in: input)!])")
        }
        
        let tuples = NSRegularExpression.matchTuple(NSRegularExpression.Pattern.alphabet.rawValue, input: input)
        DDLog(tuples)
        
        let dic = NSRegularExpression.matchDic(NSRegularExpression.Pattern.alphabet.rawValue, input: input)
        DDLog(dic)
//        let result2 = NSRegularExpression.matchString2(.number, input: input)
//        let result3 = NSRegularExpression.matchString2(.nonNumber, input: input)
//        let result6 = NSRegularExpression.matchString2(.alphabet, input: input)
//        let result7 = NSRegularExpression.matchString2(.nonAlphabet, input: input)
//        DDLog(result2)
//        DDLog(result3)
//        DDLog(result6)
//        DDLog(result7)
    }
    
    func test3() {
//        let input = "My name is Taylor, My name is Swift"
        let input = "My name is 泰勒 88.8, My name is 斯威夫特 99.9"

//        let pattern = "My name is (.*)"
        let pattern = "[\\u4E00-\\u9FA5]"

//        let result = NSRegularExpression.matchString(pattern, input: input)
        let result = NSRegularExpression.matchString(NSRegularExpression.Pattern.hanzi.rawValue, input: input)
        let result1 = NSRegularExpression.matchString(NSRegularExpression.Pattern.nonHanzi.rawValue, input: input)
        let result2 = NSRegularExpression.matchString(NSRegularExpression.Pattern.number.rawValue, input: input)
        let result3 = NSRegularExpression.matchString(NSRegularExpression.Pattern.nonNumber.rawValue, input: input)
        let result4 = NSRegularExpression.matchString(NSRegularExpression.Pattern.float.rawValue, input: input)
        let result5 = NSRegularExpression.matchString(NSRegularExpression.Pattern.nonFloat.rawValue, input: input)
        let result6 = NSRegularExpression.matchString(NSRegularExpression.Pattern.alphabet.rawValue, input: input)
        let result7 = NSRegularExpression.matchString(NSRegularExpression.Pattern.nonAlphabet.rawValue, input: input)
        
//        let result = NSRegularExpression.matchString2(.hanzi, input: input)
//        let result1 = NSRegularExpression.matchString2(.nonHanzi, input: input)
//        let result2 = NSRegularExpression.matchString2(.number, input: input)
//        let result3 = NSRegularExpression.matchString2(.nonNumber, input: input)
//        let result4 = NSRegularExpression.matchString2(.float, input: input)
//        let result5 = NSRegularExpression.matchString2(.nonFloat, input: input)
//        let result6 = NSRegularExpression.matchString2(.alphabet, input: input)
//        let result7 = NSRegularExpression.matchString2(.nonAlphabet, input: input)
        DDLog(result)
        DDLog(result1)
        DDLog(result2)
        DDLog(result3)
        DDLog(result4)
        DDLog(result5)
        DDLog(result6)
        DDLog(result7)
        
    }
    
    func test4() {
        let input = "My name is 泰勒 88.8, My name is 斯威夫特 99.9"

        let tuples = NSRegularExpression.matchTuple(NSRegularExpression.Pattern.alphabet.rawValue, input: input)
        DDLog(tuples)//[({0, 2}, "My"), ({3, 4}, "name"), ({8, 2}, "is"), ({20, 2}, "My"), ({23, 4}, "name"), ({28, 2}, "is")]
        
        let dic = NSRegularExpression.matchDic(NSRegularExpression.Pattern.alphabet.rawValue, input: input)
        DDLog(dic)// ["{28, 2}": "is", "{23, 4}": "name", "{8, 2}": "is", "{0, 2}": "My", "{3, 4}": "name", "{20, 2}": "My"]
        
        let result = NSRegularExpression.matchTuple2(.hanzi, input: input)
        let result1 = NSRegularExpression.matchTuple2(.nonHanzi, input: input)
        let result2 = NSRegularExpression.matchTuple2(.number, input: input)
        let result3 = NSRegularExpression.matchTuple2(.nonNumber, input: input)
        let result4 = NSRegularExpression.matchTuple2(.float, input: input)
        let result5 = NSRegularExpression.matchTuple2(.nonFloat, input: input)
        let result6 = NSRegularExpression.matchTuple2(.alphabet, input: input)
        let result7 = NSRegularExpression.matchTuple2(.nonAlphabet, input: input)
        DDLog(result)
        DDLog(result1)
        DDLog(result2)
        DDLog(result3)
        DDLog(result4)
        DDLog(result5)
        DDLog(result6)
        DDLog(result7)
    }

}


class NSPredicateDemoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        test1()
    }
    
    func test1() {

    }
    
}
