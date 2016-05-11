//
//  BaseViewModel.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

/**  取消任务 */
- (void)cancelTask {
    [self.dataTask cancel];
}
/**  暂停任务 */
- (void)suspendTask {
    [self.dataTask suspend];
}
/**  继续任务 */
- (void)resumeTask {
    [self.dataTask resume];
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
