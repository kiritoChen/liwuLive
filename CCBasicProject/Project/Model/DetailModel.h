//
//  DetailModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailDataModel;
@interface DetailModel : NSObject


@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSArray<DetailDataModel *> *data;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger pageCount;

@end
@interface DetailDataModel : NSObject

@property (nonatomic, copy) NSString *defaultImage;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *categorySlug;

@property (nonatomic, copy) NSString *recommendImage;

@property (nonatomic, copy) NSString *playAt;

@property (nonatomic, copy) NSString *appShufflingImage;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, copy) NSString *videoQuality;

@property (nonatomic, copy) NSString *categoryId;

@property (nonatomic, assign) NSInteger follow;

@end

