//
//  HomePageModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HomePageModel.h"

@implementation HomePageModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"mobileBeauty": @"mobile-beauty",
             @"mobileDota2": @"mobile-dota2",
             @"mobileHeartstone": @"mobile-heartstone",
             @"mobileIndex": @"mobile-index",
             @"mobileLol": @"mobile-lol",
             @"mobileRecommendation": @"mobile-recommendation",
             @"mobileStar": @"mobile-star",
             @"mobileTvgame": @"mobile-tvgame",
             @"mobileBlizzard": @"moblie-blizzard",
             @"mobileDnf": @"moblie-dnf",
             @"mobileMinecraft": @"moblie-minecraft",
             @"mobileSport": @"moblie-sport",
             @"mobileWebgame": @"moblie-webgame"};//li
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"mobileBeauty": [HomePageMobileLinkModel class],
             @"mobileDota2": [HomePageMobileLinkModel class],
             @"mobileHeartstone": [HomePageMobileLinkModel class],
             @"mobileIndex": [HomePageMobileModel class],
             @"mobileLol": [HomePageMobileLinkModel class],
             @"mobileRecommendation": [HomePageMobileModel class],
             @"mobileStar": [HomePageMobileModel class],
             @"mobileTvgame": [HomePageMobileLinkModel class],
             @"mobileBlizzard": [HomePageMobileLinkModel class],
             @"mobileDnf": [HomePageMobileLinkModel class],
             @"mobileMinecraft": [HomePageMobileLinkModel class],
             @"mobileSport": [HomePageMobileLinkModel class],
             @"mobileWebgame": [HomePageMobileLinkModel class],
             @"list": [HomePageListModel class]};
}
@end

@implementation HomePageMobileLinkModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"linkObject": @"link_object"};
}
@end

@implementation HomePageListModel

@end

@implementation HomePageLinkObjectModel
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

@implementation HomePageMobileModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"linkObject": @"link_object",
             @"ID": @"id",
             @"slotId": @"slot_id",
             @"createAt": @"create_at",
             
             };
}
@end


