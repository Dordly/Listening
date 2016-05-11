//
//  TrackRankTableViewCell.h
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TrackRankTableViewCellDelegate <NSObject>

- (void)trackRankTableViewCellDidCilckDownloadButton;

@end

@interface TrackRankTableViewCell : UITableViewCell

@property (nonatomic,weak) id<TrackRankTableViewCellDelegate> delegate;

- (void)bindTrackRankTableViewCellDataWithDictionary:(NSDictionary *)dict indexPath:(NSIndexPath *)indexPath;

@end
