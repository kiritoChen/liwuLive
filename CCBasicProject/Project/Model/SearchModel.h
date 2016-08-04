//
//  SearchModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/18.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SearchDataModel, SearchDataItemsModel;

@interface SearchModel : NSObject
@property (nonatomic, strong) SearchDataModel *data;
@property (nonatomic, assign) NSInteger code;
@end

@interface SearchDataModel : NSObject
@property (nonatomic, assign) NSInteger playStatus;
@property (nonatomic, assign) NSInteger pageNb;
@property (nonatomic, strong) NSArray<SearchDataItemsModel *> *items;
@property (nonatomic, assign) NSInteger total;
@end

@interface SearchDataItemsModel : NSObject
@property (nonatomic, copy) NSString *categorySlug;
@property (nonatomic, assign) NSString *uid;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *view;
@end