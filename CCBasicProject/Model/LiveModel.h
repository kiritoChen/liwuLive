//
//  LiveModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveDataModel,LiveRecommendDataModel;

@interface LiveModel : NSObject
// 字典包含字典进行合并
//@property (nonatomic, strong) LiveRecommendModel *recommend;
@property (nonatomic, strong) NSArray<LiveDataModel *> *data;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy) NSString *icon;
//@end
//
//@interface LiveRecommendModel : NSObject
@property (nonatomic, copy) NSString *recommendName;
@property (nonatomic, copy) NSString *recommendIcon;
@property (nonatomic, strong) NSArray<LiveRecommendDataModel *> *recommendData;
@end

@interface LiveRecommendDataModel : NSObject
@property (nonatomic, assign) NSInteger ID;// id - ID
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *subTitle;// <- subtitle
@property (nonatomic, assign) NSInteger slotId;// <- slot_id
@property (nonatomic, copy) NSString *link;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *createAt;// <- create_at
//@property (nonatomic, strong) Link_Object *linkObject;// <- link_object
@property (nonatomic, copy) NSString *ext;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *fk;
//@end
//
//@interface Link_Object : NSObject
@property (nonatomic, copy) NSString *defaultImage;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *linkStatus;
@property (nonatomic, copy) NSString *linkTitle;
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *category_slug;
@property (nonatomic, copy) NSString *recommendImage;
@property (nonatomic, copy) NSString *playAt;
@property (nonatomic, copy) NSString *appShufflingImage;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *linkThumb;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *announcement;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *view;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *videoQuality;
@property (nonatomic, copy) NSString *categoryId;
@property (nonatomic, copy) NSString *follow;
@end

@interface LiveDataModel : NSObject
@property (nonatomic, copy) NSString *default_image;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *category_slug;
@property (nonatomic, copy) NSString *recommend_image;
@property (nonatomic, copy) NSString *play_at;
@property (nonatomic, copy) NSString *app_shuffling_image;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *announcement;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *view;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *video_quality;
@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, assign) NSInteger follow;
@end

