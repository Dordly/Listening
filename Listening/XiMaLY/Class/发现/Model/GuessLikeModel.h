//
//  GuessLikeModel.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "BaseModel.h"

@class GuessLikeList;
@interface GuessLikeModel : BaseModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<GuessLikeList *> *list;

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, assign) NSInteger ret;


@end

@interface GuessLikeList : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger lastUptrackId;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *recSrc;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) long long lastUptrackAt;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *recTrack;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger basedRelativeAlbumId;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *lastUptrackTitle;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, copy) NSString *recReason;

@end

