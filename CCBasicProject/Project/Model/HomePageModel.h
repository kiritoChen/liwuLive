//
//  HomePageModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomePageLinkObjectModel, HomePageMobileModel, HomePageListModel, HomePageMobileLinkModel;

@interface HomePageModel : NSObject
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileWebgame;
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileMinecraft;
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileTvgame;
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileSport;
@property (nonatomic, strong) NSArray<HomePageMobileModel *> *mobileStar;
@property (nonatomic, strong) NSArray<HomePageMobileModel *> *mobileRecommendation;
@property (nonatomic, strong) NSArray<HomePageMobileModel *> *mobileIndex;// 两种
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileLol;
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileBeauty;
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileHeartstone;
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileBlizzard;
@property (nonatomic, strong) NSArray<HomePageListModel *> *list;
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileDota2;
@property (nonatomic, strong) NSArray<HomePageMobileLinkModel *> *mobileDnf;
@end

@interface HomePageMobileLinkModel : NSObject
@property (nonatomic, strong) HomePageLinkObjectModel *linkObject;
@end

@interface HomePageLinkObjectModel : NSObject
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
@property (nonatomic, copy) NSString *follow;
@end


@interface HomePageMobileModel : NSObject
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) NSInteger slotId;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *createAt;
@property (nonatomic, strong) HomePageLinkObjectModel *linkObject;
@property (nonatomic, copy) NSString *ext;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *fk;
@end

@interface HomePageListModel : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *slug;
@end




