//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RootClass : NSObject, NSCoding, Mappable{

	var args : Arg?
	var headers : Header?
	var origin : String?
	var url : String?


	class func newInstance(map: Map) -> Mappable?{
		return RootClass()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		args <- map["args"]
		headers <- map["headers"]
		origin <- map["origin"]
		url <- map["url"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         args = aDecoder.decodeObject(forKey: "args") as? Arg
         headers = aDecoder.decodeObject(forKey: "headers") as? Header
         origin = aDecoder.decodeObject(forKey: "origin") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if args != nil{
			aCoder.encode(args, forKey: "args")
		}
		if headers != nil{
			aCoder.encode(headers, forKey: "headers")
		}
		if origin != nil{
			aCoder.encode(origin, forKey: "origin")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}