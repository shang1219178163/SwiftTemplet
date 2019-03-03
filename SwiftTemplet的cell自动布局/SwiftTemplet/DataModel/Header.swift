//
//	Header.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Header : NSObject, NSCoding, Mappable{

	var accept : String?
	var acceptEncoding : String?
	var acceptLanguage : String?
	var connection : String?
	var host : String?
	var userAgent : String?


	class func newInstance(map: Map) -> Mappable?{
		return Header()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		accept <- map["Accept"]
		acceptEncoding <- map["Accept-Encoding"]
		acceptLanguage <- map["Accept-Language"]
		connection <- map["Connection"]
		host <- map["Host"]
		userAgent <- map["User-Agent"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         accept = aDecoder.decodeObject(forKey: "Accept") as? String
         acceptEncoding = aDecoder.decodeObject(forKey: "Accept-Encoding") as? String
         acceptLanguage = aDecoder.decodeObject(forKey: "Accept-Language") as? String
         connection = aDecoder.decodeObject(forKey: "Connection") as? String
         host = aDecoder.decodeObject(forKey: "Host") as? String
         userAgent = aDecoder.decodeObject(forKey: "User-Agent") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if accept != nil{
			aCoder.encode(accept, forKey: "Accept")
		}
		if acceptEncoding != nil{
			aCoder.encode(acceptEncoding, forKey: "Accept-Encoding")
		}
		if acceptLanguage != nil{
			aCoder.encode(acceptLanguage, forKey: "Accept-Language")
		}
		if connection != nil{
			aCoder.encode(connection, forKey: "Connection")
		}
		if host != nil{
			aCoder.encode(host, forKey: "Host")
		}
		if userAgent != nil{
			aCoder.encode(userAgent, forKey: "User-Agent")
		}

	}

}