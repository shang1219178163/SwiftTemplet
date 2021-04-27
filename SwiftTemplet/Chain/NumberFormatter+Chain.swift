//
//	NumberFormatter+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/23 08:52
//	Copyright © 2021 Bin Shang. All rights reserved.
//



@available(iOS 6.0, *)
public extension NumberFormatter {

    @available(iOS 8.0, *)
    func formattingContext(_ formattingContext: Formatter.Context) -> Self {
        self.formattingContext = formattingContext
        return self
    }

    func numberStyle(_ numberStyle: NumberFormatter.Style) -> Self {
        self.numberStyle = numberStyle
        return self
    }

    func locale(_ locale: Locale!) -> Self {
        self.locale = locale
        return self
    }

    func generatesDecimalNumbers(_ generatesDecimalNumbers: Bool) -> Self {
        self.generatesDecimalNumbers = generatesDecimalNumbers
        return self
    }

    func formatterBehavior(_ formatterBehavior: NumberFormatter.Behavior) -> Self {
        self.formatterBehavior = formatterBehavior
        return self
    }

    func negativeFormat(_ negativeFormat: String!) -> Self {
        self.negativeFormat = negativeFormat
        return self
    }

    func textAttributesForNegativeValues(_ textAttributesForNegativeValues: [String : Any]) -> Self {
        self.textAttributesForNegativeValues = textAttributesForNegativeValues
        return self
    }

    func positiveFormat(_ positiveFormat: String!) -> Self {
        self.positiveFormat = positiveFormat
        return self
    }

    func textAttributesForPositiveValues(_ textAttributesForPositiveValues: [String : Any]) -> Self {
        self.textAttributesForPositiveValues = textAttributesForPositiveValues
        return self
    }

    func allowsFloats(_ allowsFloats: Bool) -> Self {
        self.allowsFloats = allowsFloats
        return self
    }

    func decimalSeparator(_ decimalSeparator: String!) -> Self {
        self.decimalSeparator = decimalSeparator
        return self
    }

    func alwaysShowsDecimalSeparator(_ alwaysShowsDecimalSeparator: Bool) -> Self {
        self.alwaysShowsDecimalSeparator = alwaysShowsDecimalSeparator
        return self
    }

    func currencyDecimalSeparator(_ currencyDecimalSeparator: String!) -> Self {
        self.currencyDecimalSeparator = currencyDecimalSeparator
        return self
    }

    func usesGroupingSeparator(_ usesGroupingSeparator: Bool) -> Self {
        self.usesGroupingSeparator = usesGroupingSeparator
        return self
    }

    func groupingSeparator(_ groupingSeparator: String!) -> Self {
        self.groupingSeparator = groupingSeparator
        return self
    }

    func zeroSymbol(_ zeroSymbol: String?) -> Self {
        self.zeroSymbol = zeroSymbol
        return self
    }

    func textAttributesForZero(_ textAttributesForZero: [String : Any]) -> Self {
        self.textAttributesForZero = textAttributesForZero
        return self
    }

    func nilSymbol(_ nilSymbol: String) -> Self {
        self.nilSymbol = nilSymbol
        return self
    }

    func textAttributesForNil(_ textAttributesForNil: [String : Any]) -> Self {
        self.textAttributesForNil = textAttributesForNil
        return self
    }

    func notANumberSymbol(_ notANumberSymbol: String!) -> Self {
        self.notANumberSymbol = notANumberSymbol
        return self
    }

    func textAttributesForNotANumber(_ textAttributesForNotANumber: [String : Any]) -> Self {
        self.textAttributesForNotANumber = textAttributesForNotANumber
        return self
    }

    func positiveInfinitySymbol(_ positiveInfinitySymbol: String) -> Self {
        self.positiveInfinitySymbol = positiveInfinitySymbol
        return self
    }

    func textAttributesForPositiveInfinity(_ textAttributesForPositiveInfinity: [String : Any]) -> Self {
        self.textAttributesForPositiveInfinity = textAttributesForPositiveInfinity
        return self
    }

    func negativeInfinitySymbol(_ negativeInfinitySymbol: String) -> Self {
        self.negativeInfinitySymbol = negativeInfinitySymbol
        return self
    }

    func textAttributesForNegativeInfinity(_ textAttributesForNegativeInfinity: [String : Any]) -> Self {
        self.textAttributesForNegativeInfinity = textAttributesForNegativeInfinity
        return self
    }

    func positivePrefix(_ positivePrefix: String!) -> Self {
        self.positivePrefix = positivePrefix
        return self
    }

    func positiveSuffix(_ positiveSuffix: String!) -> Self {
        self.positiveSuffix = positiveSuffix
        return self
    }

    func negativePrefix(_ negativePrefix: String!) -> Self {
        self.negativePrefix = negativePrefix
        return self
    }

    func negativeSuffix(_ negativeSuffix: String!) -> Self {
        self.negativeSuffix = negativeSuffix
        return self
    }

    func currencyCode(_ currencyCode: String!) -> Self {
        self.currencyCode = currencyCode
        return self
    }

    func currencySymbol(_ currencySymbol: String!) -> Self {
        self.currencySymbol = currencySymbol
        return self
    }


    func internationalCurrencySymbol(_ internationalCurrencySymbol: String!) -> Self {
        self.internationalCurrencySymbol = internationalCurrencySymbol
        return self
    }

    func percentSymbol(_ percentSymbol: String!) -> Self {
        self.percentSymbol = percentSymbol
        return self
    }


    func perMillSymbol(_ perMillSymbol: String!) -> Self {
        self.perMillSymbol = perMillSymbol
        return self
    }

    func minusSign(_ minusSign: String!) -> Self {
        self.minusSign = minusSign
        return self
    }


    func plusSign(_ plusSign: String!) -> Self {
        self.plusSign = plusSign
        return self
    }

    func exponentSymbol(_ exponentSymbol: String!) -> Self {
        self.exponentSymbol = exponentSymbol
        return self
    }

    func groupingSize(_ groupingSize: Int) -> Self {
        self.groupingSize = groupingSize
        return self
    }

    func secondaryGroupingSize(_ secondaryGroupingSize: Int) -> Self {
        self.secondaryGroupingSize = secondaryGroupingSize
        return self
    }

    func multiplier(_ multiplier: NSNumber?) -> Self {
        self.multiplier = multiplier
        return self
    }

    func formatWidth(_ formatWidth: Int) -> Self {
        self.formatWidth = formatWidth
        return self
    }


    func paddingCharacter(_ paddingCharacter: String!) -> Self {
        self.paddingCharacter = paddingCharacter
        return self
    }


    func paddingPosition(_ paddingPosition: NumberFormatter.PadPosition) -> Self {
        self.paddingPosition = paddingPosition
        return self
    }

    func roundingMode(_ roundingMode: NumberFormatter.RoundingMode) -> Self {
        self.roundingMode = roundingMode
        return self
    }

    func roundingIncrement(_ roundingIncrement: NSNumber!) -> Self {
        self.roundingIncrement = roundingIncrement
        return self
    }

    func minimumIntegerDigits(_ minimumIntegerDigits: Int) -> Self {
        self.minimumIntegerDigits = minimumIntegerDigits
        return self
    }


    func maximumIntegerDigits(_ maximumIntegerDigits: Int) -> Self {
        self.maximumIntegerDigits = maximumIntegerDigits
        return self
    }


    func minimumFractionDigits(_ minimumFractionDigits: Int) -> Self {
        self.minimumFractionDigits = minimumFractionDigits
        return self
    }


    func maximumFractionDigits(_ maximumFractionDigits: Int) -> Self {
        self.maximumFractionDigits = maximumFractionDigits
        return self
    }


    func minimum(_ minimum: NSNumber?) -> Self {
        self.minimum = minimum
        return self
    }


    func maximum(_ maximum: NSNumber?) -> Self {
        self.maximum = maximum
        return self
    }

    func currencyGroupingSeparator(_ currencyGroupingSeparator: String!) -> Self {
        self.currencyGroupingSeparator = currencyGroupingSeparator
        return self
    }

    func isLenient(_ isLenient: Bool) -> Self {
        self.isLenient = isLenient
        return self
    }

    func usesSignificantDigits(_ usesSignificantDigits: Bool) -> Self {
        self.usesSignificantDigits = usesSignificantDigits
        return self
    }

    func minimumSignificantDigits(_ minimumSignificantDigits: Int) -> Self {
        self.minimumSignificantDigits = minimumSignificantDigits
        return self
    }

    func maximumSignificantDigits(_ maximumSignificantDigits: Int) -> Self {
        self.maximumSignificantDigits = maximumSignificantDigits
        return self
    }

    func isPartialStringValidationEnabled(_ isPartialStringValidationEnabled: Bool) -> Self {
        self.isPartialStringValidationEnabled = isPartialStringValidationEnabled
        return self
    }

}
