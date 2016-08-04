//
//  SearchModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/18.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel

@end

@implementation SearchDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items": [SearchDataItemsModel class]};
}
@end

@implementation SearchDataItemsModel

@end