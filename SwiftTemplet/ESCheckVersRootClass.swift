//
//	ESCheckVersRootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import HandyJSON


class ESCheckVersRootClass: NSObject, HandyJSON{

	@objc var resultCount : Int = 0
	@objc var results : [ESCheckVersResult]?


	///	implement an empty initializer.
	required override init(){
	}

	///	HandyJSON - Comment out does not need to convert.
	func mapping(mapper: HelpingMapper)	{
//		mapper <<< resultCount <-- "resultCount"
//		mapper <<< results <-- "results"
		
	}

}
