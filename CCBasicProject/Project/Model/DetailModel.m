//
//  DetailModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": [DetailDataModel class]};
}
@end
@implementation DetailDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"defaultImage": @"default_image",
             @"categoryName": @"category_name",
             @"categorySlug": @"category_slug",
             @"recommendImage": @"recommend_image",
             @"playAt": @"play_at",
             @"appShufflingImage": @"app_shuffling_image",
             @"startTime": @"start_time",
             @"videoQuality": @"video_quality",
             @"categoryId": @"category_id"};
}
@end


