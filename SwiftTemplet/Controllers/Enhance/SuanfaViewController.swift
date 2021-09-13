//
//  SuanfaViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class SuanfaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

       paixu()
       daoxu()
       shaixuan()
       xunzao()
       erfenfa()
       DDLog(digui())
       sushu()
        gongyueshu(a: 55, b: 100)
    }

    /**  冒泡排序  */
    func paixu() {
        var arr = [24,17,85,13,9,54,76,45,5,63]
        for i in 0..<arr.count {
            for j in 0..<arr.count - 1 - i {
                if arr[j] < arr[j + 1] {
                    let tmp = arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = tmp
                }
            }
        }
        DDLog(arr)
        //sort 是对数组本身进行排序，也就是意味着 sort 方法会修改数组本身的内容。 而 sorted 就不会修改原有的数组，而是返回一个经过排序处理后的新的数组
        arr.sort {$0 < $1}
        DDLog(arr)
        DDLog(arr.sorted {$0 < $1})
    }
    /**  倒序输出  */
    func daoxu() {
        let str = "how are you"
        //先拆分成数组
        let arr = str.split(separator: " ").map(String.init)
        //倒序输出
        //reversed 方法可以将数组中的元素倒序排列
        let arr1 = Array(arr.reversed())
        DDLog(arr1)
        for item in arr1 {
            DDLog(item)
        }
    }
    /**  筛选  */
    func shaixuan() {
        let arr = [2,3,4,5,4,3,7,8,3]
        //用集合最简单
        let set = Set(arr)
        let arr1 = Array(set)

        DDLog(arr1)
        //字典筛选key
        var dic = Dictionary<Int, Any>()
        for item in arr {
            dic[item] = item
        }
        DDLog(Array(dic.keys))
    }
    /**  给定一个字符串，输出本字符串中只出现一次并且最靠前的那个字符的位置？如“abaccddeeef”,字符是b,输出应该是2  */
    func xunzao() {
        let str = "abaccddeeef"
        var arr = Array<Character>()
        var arr1 = Array<Character>()
        for item in str {
            if arr.contains(item) {
                arr1.append(item)
            }else{
                arr.append(item)
            }
        }
        var arr2 = Array<Character>()
        var arr3 = Array<Character>()
        for item in str {
            if !arr1.contains(item) {
                arr2.append(item)
            }
            arr3.append(item)
        }
        DDLog(arr3.index(of: arr2.first!)! + 1)

    }
    /**  二分法查找（只实用于有序数组）  */
    func erfenfa() {//36
        let tmp = 36

        var array = [1, 2, 50, 3, 9, 5, 5, 7, 10, 36]
        //先排序
        array.sort()
        DDLog(array)
        var left = 0
        var right = (array.count - 1)

        while left <= right {
            let mid = (left + right) / 2
            let value = array[mid]
            if value == tmp {
                return
            }
            if value < tmp {
                left = mid + 1
            }
            if value > tmp {
                right = mid - 1
            }
        }
    }
    /**  递归法查找  */
    var left = 0
    func digui() -> Int {
        let tmp = 36

        var array = [1, 2, 50, 3, 9, 5, 5, 7, 10, 36]
        let right = (array.count - 1)
        var mid = (left + right) / 2
        let value = array[mid]

        if left > right {
            return -1
        }else{
            left += 1
            if value == tmp {
                return mid
            }else if value > tmp {
                mid = mid - 1
                return self.digui()
            }else{
                mid = mid + 1
                return self.digui()
            }
        }
    }

    /**  2-100之间的素数  */
    func sushu() {
        for i in 2..<100 {
            var r : Int = 1
            for j in 2..<i {
                if i%j == 0 {
                    r = 0
                    break
                }
            }
            if r == 1 {
                DDLog(i)
            }
        }
    }
    /**  两个整数的最大公约数  */
    func gongyueshu( a:Int, b:Int) {
        var a = a
        var b = b
        var tmp = 0
        if a < b {
            tmp = a
            a = b
            b = tmp
        }
        while b != 0 {
            tmp = a%b
            a = b
            b = tmp
        }
        DDLog(a)
    }

}


extension String{
    
    ///子字符串在父串出现的次数
    func countOccurencesOf(_ aString: String) -> Int {
        return components(separatedBy: aString).count - 1
    }
    
    func countOccurencesOf1(_ aString: String) -> Int {
        let tmp = replacingOccurrences(of: aString, with: "")
        return (count - tmp.count)/aString.count
    }
}
