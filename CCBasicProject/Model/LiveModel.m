//
//  LiveModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"recommendName": @"recommend.name",
             @"recommendIcon": @"recommend.icon",
             @"recommendData": @"recommend.data"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": [LiveDataModel class],
             @"recommendData": [LiveRecommendDataModel class]};
}
@end

@implementation LiveDataModel
@end

@implementation LiveRecommendDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id",
             @"subTitle": @"subtitle",
             @"slotId": @"slot_id",
             @"createAt": @"create_at",
//             @"linkObject": @"link_object",
             // 合并link_object
             @"defaultImage": @"link_object.default_image",
             @"slug": @"link_object.slug",
             @"weight": @"link_object.weight",
             @"linkStatus": @"link_object.status",
             @"linkTitle": @"link_object.title",
             @"categoryName": @"link_object.category_name",
             @"hidden": @"link_object.hidden",
             @"intro": @"link_object.intro",
             @"categorySlug": @"link_object.category_slug",
             @"recommendImage": @"link_object.recommend_image",
             @"playAt": @"link_object.play_at",
             @"appShufflingImage": @"link_object.app_shuffling_image",
             @"level": @"link_object.level",
             @"linkThumb": @"link_object.thumb",
             @"grade": @"link_object.grade",
             @"nick": @"link_object.nick",
             @"announcement": @"link_object.announcement",
             @"uid": @"link_object.uid",
             @"avatar": @"link_object.avatar",
             @"view": @"link_object.view",
             @"startTime": @"link_object.start_time",
             @"videoQuality": @"link_object.video_quality",
             @"categoryId": @"link_object.category_id",
             @"follow": @"link_object.follow"};
}
@end


















