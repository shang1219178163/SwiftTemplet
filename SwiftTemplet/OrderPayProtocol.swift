//
//  OrderPayProtocol.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/9.
//  Copyright © 2021 BN. All rights reserved.
//
import SwiftExpand

// 定义一个收费的策略接口
protocol OrderPayProtocol {
    func accept(money: Double) -> Double
    
}
// 普通收费子类
class OrderPayNormalStrategy: OrderPayProtocol {
    // 正常原价返回
    func accept(money: Double) -> Double {
        return money
    }
    
}
// 打折收费子类
class OrderPayDiscountStrategy: OrderPayProtocol {
    // 折扣率
    private var moneyDiscount: Double = 1.0
    init(moneyDiscount: Double) {
        self.moneyDiscount = moneyDiscount
    }
    func accept(money: Double) -> Double {
        return money*moneyDiscount
    }
}
// 返利收费子类
class OrderPayRebateStrategy: OrderPayProtocol {
    // 返利要求
    private var moneyCondition: Double = 0
    // 返多少
    private var moneyReturn: Double = 0
    init(moneyCondition: Double, moneyReturn: Double) {
        self.moneyCondition = moneyCondition
        self.moneyReturn    = moneyReturn
    }
    func accept(money: Double) -> Double {
        var result = money
        if money >= moneyCondition {
            result = money - floor(money / moneyCondition) * moneyReturn
        }
        return result
    }
}
// context类
class OrderPayContext {

    private var cs: OrderPayProtocol?
    // 通过枚举判断使用哪种方式
    init(style: OrderPayStrategyStyle) {
        switch style {
        case .normal:
            cs = OrderPayNormalStrategy()
        case .discount(moneyDiscount: let money):
            cs = OrderPayDiscountStrategy(moneyDiscount: money)
        case .rebate(moneyCondition: let condition, moneyReturn: let moneyReturn):
            cs = OrderPayRebateStrategy(moneyCondition: condition, moneyReturn: moneyReturn)
        }
    }
    
    func getResult(money: Double) -> Double {
        return cs?.accept(money: money) ?? 0
    }
    
    ///传入策略
    static func caculate(money: Double, strategy: OrderPayProtocol) -> Double{
        return strategy.accept(money: money)
    }
    
    ///传入策略
    static func caculate(money: Double, style: OrderPayStrategyStyle) -> Double{
        let ctx = OrderPayContext(style: style)
        return ctx.getResult(money: money)
    }
    
    ///示例
    static func testExpample(_ money: Double = 300) {
//        let money: Double = 300
        // 普通
        let normal = OrderPayContext(style: .normal)
        // 打7折
        let discount = OrderPayContext(style: .discount(moneyDiscount: 0.7))
        // 满一百返20
        let rebate = OrderPayContext(style: .rebate(moneyCondition: 100, moneyReturn: 20))
        
        let normalValue = normal.getResult(money: money)
        let discountValue = discount.getResult(money: money)
        let rebateValue = rebate.getResult(money: money)
        DDLog("普通: \(normalValue)")
        DDLog("打7折: \(discountValue)")
        DDLog("满一百返20: \(rebateValue)")
        
        // 普通
        let normalStrategy = OrderPayNormalStrategy()
        // 打7折
        let discountStrategy = OrderPayDiscountStrategy(moneyDiscount: 0.7)
        // 满一百返20
        let rebateStrategy = OrderPayRebateStrategy(moneyCondition: 100, moneyReturn: 20)
        let value1 = OrderPayContext.caculate(money: money, strategy: normalStrategy)
        let value2 = OrderPayContext.caculate(money: money, strategy: discountStrategy)
        let value3 = OrderPayContext.caculate(money: money, strategy: rebateStrategy)
        DDLog(value1, value2, value3)
        
        
        let price1 = OrderPayContext.caculate(money: money, style: .normal)
        let price2 = OrderPayContext.caculate(money: money, style: .discount(moneyDiscount: 0.7))
        let price3 = OrderPayContext.caculate(money: money, style: .rebate(moneyCondition: 100, moneyReturn: 20))
        DDLog(price1, price2, price3)
    }
}
// 优惠的枚举类型
enum OrderPayStrategyStyle {
    case normal
    case discount(moneyDiscount: Double)
    case rebate(moneyCondition: Double, moneyReturn: Double)
}

