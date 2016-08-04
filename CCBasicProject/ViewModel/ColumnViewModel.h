//
//  ColumnViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"
#import "BasicViewModel.h"

@interface ColumnViewModel : BasicViewModel

@property (nonatomic) NSInteger numForRow;
- (NSURL *)imageURLForRow:(NSInteger)row;
- (NSString *)nameForRow:(NSInteger)row;
- (ColumnModel *)modelForRow:(NSInteger)row;
- (NSString *)gameNameForRow:(NSInteger)row;
- (NSString *)slugForRow:(NSInteger)row;
@property (nonatomic) NSArray *columnList;

@end
