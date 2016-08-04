//
//  ColumnViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "ColumnViewModel.h"

@implementation ColumnViewModel

- (NSInteger)numForRow{
    return self.columnList.count;
}
- (NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
- (NSURL *)imageURLForRow:(NSInteger)row{
    return [self modelForRow:row].thumb.cc_URL;
}
- (NSString *)slugForRow:(NSInteger)row{
    return [self modelForRow:row].slug;
}
- (NSString *)gameNameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

- (ColumnModel *)modelForRow:(NSInteger)row{
    return self.columnList[row];
}
- (void)getDataCompletionHandler:(void (^)(NSError *))completionHandler{
    [NetManager getColumnDataCompletionHandler:^(id columnModel, NSError *error) {
        self.columnList = columnModel;
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSArray *)columnList{
    if (!_columnList) {
        _columnList = [NSArray new];
    }
    return _columnList;
}

@end
