//
//  ColumnModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "ColumnModel.h"

@implementation ColumnModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"firstLetter": @"first_letter",
             @"ID": @"id"};
}
@end



