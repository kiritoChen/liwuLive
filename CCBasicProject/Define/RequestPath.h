//
//  RequestPath.h
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#ifndef RequestPath_h
#define RequestPath_h

// 直播页数据地址, 下一页http://www.quanmin.tv/json/play/list_1.json
#define kLivePath @"http://www.quanmin.tv/json/play/list%@.json"
// 栏目页首页数据地址
#define kColumnPath @"http://www.quanmin.tv/json/categories/list.json"

// 播放地址
#define kPlayPath @"http://hls.quanmin.tv/live/%@/playlist.m3u8"
// 栏目首页的下一页数据
#define kDetailPath @"http://www.quanmin.tv/json/categories/%@/list%@.json"
// 首页的数据
#define kHomePagePath @"http://www.quanmin.tv/json/page/app-index/info.json"

#define kSearchPath @"http://www.quanmin.tv/api/v1"

#endif /* RequestPath_h */
