//
//	Arg.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Arg : NSObject, NSCoding, Mappable{

	var one : String?


	class func newInstance(map: Map) -> Mappable?{
		return Arg()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		one <- map["one"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         one = aDecoder.decodeObject(forKey: "one") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if one != nil{
			aCoder.encode(one, forKey: "one")
		}

	}

}