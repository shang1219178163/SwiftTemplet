//
//	DateFormatter+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/23 08:52
//	Copyright © 2021 Bin Shang. All rights reserved.
//



@available(iOS 6.0, *)
public extension DateFormatter {

    // default is NSFormattingContextUnknown
    @available(iOS 8.0, *)
    func formattingContext(_ formattingContext: Formatter.Context) -> Self {
        self.formattingContext = formattingContext
        return self
    }


    func dateFormat(_ dateFormat: String!) -> Self {
        self.dateFormat = dateFormat
        return self
    }


    func dateStyle(_ dateStyle: DateFormatter.Style) -> Self {
        self.dateStyle = dateStyle
        return self
    }


    func timeStyle(_ timeStyle: DateFormatter.Style) -> Self {
        self.timeStyle = timeStyle
        return self
    }


    func locale(_ locale: Locale!) -> Self {
        self.locale = locale
        return self
    }


    func generatesCalendarDates(_ generatesCalendarDates: Bool) -> Self {
        self.generatesCalendarDates = generatesCalendarDates
        return self
    }


    func formatterBehavior(_ formatterBehavior: DateFormatter.Behavior) -> Self {
        self.formatterBehavior = formatterBehavior
        return self
    }


    func timeZone(_ timeZone: TimeZone!) -> Self {
        self.timeZone = timeZone
        return self
    }


    func calendar(_ calendar: Calendar!) -> Self {
        self.calendar = calendar
        return self
    }


    func isLenient(_ isLenient: Bool) -> Self {
        self.isLenient = isLenient
        return self
    }


    func twoDigitStartDate(_ twoDigitStartDate: Date?) -> Self {
        self.twoDigitStartDate = twoDigitStartDate
        return self
    }


    func defaultDate(_ defaultDate: Date?) -> Self {
        self.defaultDate = defaultDate
        return self
    }


    func eraSymbols(_ eraSymbols: [String]) -> Self {
        self.eraSymbols = eraSymbols
        return self
    }


    func monthSymbols(_ monthSymbols: [String]) -> Self {
        self.monthSymbols = monthSymbols
        return self
    }


    func shortMonthSymbols(_ shortMonthSymbols: [String]) -> Self {
        self.shortMonthSymbols = shortMonthSymbols
        return self
    }


    func weekdaySymbols(_ weekdaySymbols: [String]) -> Self {
        self.weekdaySymbols = weekdaySymbols
        return self
    }


    func shortWeekdaySymbols(_ shortWeekdaySymbols: [String]) -> Self {
        self.shortWeekdaySymbols = shortWeekdaySymbols
        return self
    }


    func amSymbol(_ amSymbol: String!) -> Self {
        self.amSymbol = amSymbol
        return self
    }


    func pmSymbol(_ pmSymbol: String!) -> Self {
        self.pmSymbol = pmSymbol
        return self
    }

    func longEraSymbols(_ longEraSymbols: [String]) -> Self {
        self.longEraSymbols = longEraSymbols
        return self
    }

    func veryShortMonthSymbols(_ veryShortMonthSymbols: [String]) -> Self {
        self.veryShortMonthSymbols = veryShortMonthSymbols
        return self
    }

    func standaloneMonthSymbols(_ standaloneMonthSymbols: [String]) -> Self {
        self.standaloneMonthSymbols = standaloneMonthSymbols
        return self
    }

    func shortStandaloneMonthSymbols(_ shortStandaloneMonthSymbols: [String]) -> Self {
        self.shortStandaloneMonthSymbols = shortStandaloneMonthSymbols
        return self
    }

    func veryShortStandaloneMonthSymbols(_ veryShortStandaloneMonthSymbols: [String]) -> Self {
        self.veryShortStandaloneMonthSymbols = veryShortStandaloneMonthSymbols
        return self
    }

    func veryShortWeekdaySymbols(_ veryShortWeekdaySymbols: [String]) -> Self {
        self.veryShortWeekdaySymbols = veryShortWeekdaySymbols
        return self
    }

    func standaloneWeekdaySymbols(_ standaloneWeekdaySymbols: [String]) -> Self {
        self.standaloneWeekdaySymbols = standaloneWeekdaySymbols
        return self
    }

    func shortStandaloneWeekdaySymbols(_ shortStandaloneWeekdaySymbols: [String]) -> Self {
        self.shortStandaloneWeekdaySymbols = shortStandaloneWeekdaySymbols
        return self
    }

    func veryShortStandaloneWeekdaySymbols(_ veryShortStandaloneWeekdaySymbols: [String]) -> Self {
        self.veryShortStandaloneWeekdaySymbols = veryShortStandaloneWeekdaySymbols
        return self
    }

    func quarterSymbols(_ quarterSymbols: [String]) -> Self {
        self.quarterSymbols = quarterSymbols
        return self
    }

    func shortQuarterSymbols(_ shortQuarterSymbols: [String]) -> Self {
        self.shortQuarterSymbols = shortQuarterSymbols
        return self
    }

    func standaloneQuarterSymbols(_ standaloneQuarterSymbols: [String]) -> Self {
        self.standaloneQuarterSymbols = standaloneQuarterSymbols
        return self
    }

    func shortStandaloneQuarterSymbols(_ shortStandaloneQuarterSymbols: [String]) -> Self {
        self.shortStandaloneQuarterSymbols = shortStandaloneQuarterSymbols
        return self
    }

    func gregorianStartDate(_ gregorianStartDate: Date?) -> Self {
        self.gregorianStartDate = gregorianStartDate
        return self
    }

    func doesRelativeDateFormatting(_ doesRelativeDateFormatting: Bool) -> Self {
        self.doesRelativeDateFormatting = doesRelativeDateFormatting
        return self
    }

}
