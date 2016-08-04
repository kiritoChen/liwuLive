//
//  SearchViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/18.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "SearchViewModel.h"

@implementation SearchViewModel

- (NSInteger)rowNumber{
    return self.items.count;
}

- (NSMutableArray<SearchDataItemsModel *> *)items{
    if (!_items) {
        _items = [NSMutableArray new];
    }
    return _items;
}

- (SearchDataItemsModel *)modelForRow:(NSInteger)row{
    return self.items[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].thumb];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSString *)nickForRow:(NSInteger)row{
    return [self modelForRow:row].nick;
}

- (NSString *)viewForRow:(NSInteger)row{
    NSString *views = [self modelForRow:row].view;
    if (views.doubleValue >= 10000) {
        return [NSString stringWithFormat:@"%.1f万", views.doubleValue/10000.0];
    }
    return views;
}
- (NSURL *)videoURLForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:kPlayPath, [self modelForRow:row].uid];
    return path.cc_URL;
}

- (void)getDataRequestModel:(VMRequestModel)requestModel completionHandler:(void (^)(NSError *))completionHandler{
    if (_words.length == 0) {
        completionHandler(nil);
        return;
    }
    NSInteger tmpPage = 0;
    switch (requestModel) {
        case VMRequestModelRefresh: {
            tmpPage = 0;
            break;
        }
        case VMRequestModelMore: {
            tmpPage = _page + 1;
            break;
        }
    }
    [NetManager search:_words page:tmpPage completionHandler:^(SearchModel *model, NSError *error) {
        if (!error) {
            if (requestModel == VMRequestModelRefresh) {
                [self.items removeAllObjects];
            }
            self.total = model.data.total;
            self.page = tmpPage;
            [self.items addObjectsFromArray:model.data.items];
            self.hasMore = _items.count >= self.total;
        }
        completionHandler(error);
    }];
}

@end
