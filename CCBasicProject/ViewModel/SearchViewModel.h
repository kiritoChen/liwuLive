//
//  SearchViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/18.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"
#import "BasicViewModel.h"

@interface SearchViewModel : BasicViewModel
@property (nonatomic) NSString *words;
@property (nonatomic) NSMutableArray<SearchDataItemsModel *> *items;

@property (nonatomic) NSInteger rowNumber;
- (SearchDataItemsModel *)modelForRow:(NSInteger)row;
@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger total;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)nickForRow:(NSInteger)row;
- (NSString *)viewForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;
@property (nonatomic, getter=isHasMore) BOOL hasMore;

@end
