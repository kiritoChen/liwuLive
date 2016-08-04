//
//  BasicViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VMRequestModel) {
    VMRequestModelRefresh,
    VMRequestModelMore,
};

@interface BasicViewModel : NSObject

- (void)getDataRequestModel:(VMRequestModel)requestModel completionHandler:(void(^)(NSError *error))completionHandler;

- (void)getDataCompletionHandler:(void(^)(NSError *error))completionHandler;

@end
