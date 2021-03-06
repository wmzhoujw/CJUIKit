//
//  NSCalendarCJHelper.m
//  CJFoundationDemo
//
//  Created by ciyouzen on 16/12/14.
//  Copyright (c) 2014年 dvlproad. All rights reserved.
//

#import "NSCalendarCJHelper.h"

@implementation NSCalendarCJHelper

#pragma mark - DateJudge
/* 完整的描述请参见文件头部 */
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    return [comp1 day] == [comp2 day] && [comp1 month] == [comp2 month] && [comp1 year]  == [comp2 year];
}


#pragma mark - DateValue
/** 完整的描述请参见文件头部 */
+ (NSString *)weekday_stringFromDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *dateComponents = [calendar components:calendarUnit fromDate:date];
    NSInteger weekday = [dateComponents weekday];
    
    NSArray *weekdayStringArray = @[@"天", @"一", @"二", @"三", @"四", @"五", @"六"];
    NSString *weekdayString = [weekdayStringArray objectAtIndex:weekday-1];//注意：获取到的weekday值是从1到7
    return weekdayString;
}

#pragma mark - unitIntervalFromDate
/** 完整的描述请参见文件头部 */
+ (NSInteger)year_unitIntervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    return dateIntervalNSCalendarCJHelper(fromDate, toDate, NSCalendarUnitYear);
}

/** 完整的描述请参见文件头部 */
+ (NSInteger)month_unitIntervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    return dateIntervalNSCalendarCJHelper(fromDate, toDate, NSCalendarUnitMonth);
}

/** 完整的描述请参见文件头部 */
+ (NSInteger)day_unitIntervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    return dateIntervalNSCalendarCJHelper(fromDate, toDate, NSCalendarUnitDay);
}

/* 完整的描述请参见文件头部 */
NSInteger dateIntervalNSCalendarCJHelper(NSDate *fromDate, NSDate *toDate, NSCalendarUnit calculateUnit) {
    return [NSCalendarCJHelper unitIntervalFromDate:fromDate toDate:toDate inCalculateUnit:calculateUnit];
}

/** 完整的描述请参见文件头部 */
+ (NSInteger)unitIntervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate inCalculateUnit:(NSCalendarUnit)calculateUnit {
    /*方法①：计算出相差多少秒，再根据秒来计算
    NSTimeInterval timeInterval = [toDate timeIntervalSinceDate:fromDate];
    
    NSInteger count = timeInterval/60/60/24;
    */
    
    ///*方法②：
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:calculateUnit fromDate:fromDate toDate:toDate options:0];
    
    NSInteger count = 0;
    switch (calculateUnit) {
        case NSCalendarUnitDay: {
            count = [components day];
            break;
        }
        case NSCalendarUnitMonth: {
            count = [components month];
            break;
        }
        case NSCalendarUnitYear: {
            count = [components year];
            break;
        }
        case NSCalendarUnitHour: {
            count = [components hour];
            break;
        }
        case NSCalendarUnitMinute: {
            count = [components minute];
            break;
        }
        case NSCalendarUnitSecond: {
            count = [components second];
            break;
        }
            
        default:
            break;
    }
    //*/
    
    return count;
}


/** 完整的描述请参见文件头部 */
+ (NSInteger)age_unitIntervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    ///*方法①：
    //NSInteger iAge2 = [NSCalendarCJHelper year_unitIntervalFromDate:fromDate toDate:toDate];
    //NSLog(@"方法①计算出的年纪为%zd", iAge2);
    //*/
    
    //方法②：
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:fromDate];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:toDate];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    //NSLog(@"方法②计算出的年纪为%zd", iAge);
    
    return iAge;
}




#pragma mark - dateFromUnitInterval:计算与指定日期间隔多少单位的日期
/// 指定日期的昨天
+ (NSDate *)yesterday_dateFromSinceDate:(NSDate *)sinceDate {
    return dateNSCalendarCJHelper(sinceDate, -1, NSCalendarUnitDay);
}

/// 指定日期的明天
+ (NSDate *)tomorrow_dateFromSinceDate:(NSDate *)sinceDate {
    return dateNSCalendarCJHelper(sinceDate, 1, NSCalendarUnitDay);
}

/// 指定日期的上个月
+ (NSDate *)lastMonth_dateFromSinceDate:(NSDate *)sinceDate {
    return dateNSCalendarCJHelper(sinceDate, -1, NSCalendarUnitMonth);
}

/// 指定日期的下个月
+ (NSDate *)nextMonth_dateFromSinceDate:(NSDate *)sinceDate {
    return dateNSCalendarCJHelper(sinceDate, 1, NSCalendarUnitMonth);
}

/// 指定日期的去年
+ (NSDate *)lastYear_dateFromSinceDate:(NSDate *)sinceDate {
    return dateNSCalendarCJHelper(sinceDate, -1, NSCalendarUnitYear);
}

/// 指定日期的明年
+ (NSDate *)nextYear_dateFromSinceDate:(NSDate *)sinceDate {
    return dateNSCalendarCJHelper(sinceDate, 1, NSCalendarUnitYear);
}


/// 获取距离本日期多少个单位("天"、"月"、"年"等)的日期(C函数)
NSDate *dateNSCalendarCJHelper(NSDate *sinceDate, NSInteger unitInterval, NSCalendarUnit calculateUnit) {
    return [NSCalendarCJHelper dateFromUnitInterval:unitInterval calculateUnit:calculateUnit sinceDate:sinceDate];
}

/**
 *  获取距离本日期多少个单位("天"、"月"、"年"等)的日期(OC方法)
 *
 *  @param unitInterval     多少个单位
 *  @param calculateUnit    计算的单位
 *  @param sinceDate        从什么日期开始算
 *
 *  @return 计算得出的日期
 */
+ (NSDate *)dateFromUnitInterval:(NSInteger )unitInterval
                   calculateUnit:(NSCalendarUnit)calculateUnit
                       sinceDate:(NSDate *)sinceDate
{
    //日期转换 年月日
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponents = [calendar components:calendarUnit fromDate:sinceDate];
    NSInteger year = [dateComponents year];
    NSInteger month = [dateComponents month];
    NSInteger day = [dateComponents day];
    NSInteger hour = [dateComponents hour];
    NSInteger minute = [dateComponents minute];
    NSInteger second = [dateComponents second];
    //NSLog(@"当前日期的年月日为：%d,%d,%d", year, month, day);
    
    switch (calculateUnit) {
        case NSCalendarUnitDay: {
            day += unitInterval;
            break;
        }
        case NSCalendarUnitMonth: {
            month += unitInterval;
            break;
        }
        case NSCalendarUnitYear: {
            year += unitInterval;
            break;
        }
        case NSCalendarUnitHour: {
            hour += unitInterval;
            break;
        }
        case NSCalendarUnitMinute: {
            minute += unitInterval;
            break;
        }
        case NSCalendarUnitSecond: {
            second += unitInterval;
            break;
        }
            
        default:
            break;
    }
    
    [dateComponents setYear:year];
    [dateComponents setMonth:month];
    [dateComponents setDay:day];
    [dateComponents setHour:hour];
    [dateComponents setMinute:minute];
    [dateComponents setSecond:second];
    
    //NSLog(@"------------------------------------");
    //NSLog(@"originDate    = %@", self);
    NSDate *newDate = [calendar dateFromComponents:dateComponents];
    //NSLog(@"计算后newDate  = %@", newDate);
    
    return newDate;
}




@end
