//
//  RecordTool.h
//  Listening
//
//  Created by Apple on 16/5/10.
//  Copyright © 2016年 HansRove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class RecordTool;
@protocol RecordDelegate<NSObject>

@optional
-(void)recordTool:(RecordTool *)recordTool didstartRecoring:(int)no;

@end

@interface RecordTool : NSObject

/** 录音工具的单例 */
+ (instancetype)sharedRecordTool;

/** 开始录音 */
- (void)startRecording;

/** 停止录音 */
- (void)stopRecording;

/** 播放录音文件 */
- (void)playRecordingFile;

/** 停止播放录音文件 */
- (void)stopPlaying;

/** 销毁录音文件 */
- (void)destructionRecordingFile;

/** 录音对象 */
@property (nonatomic, strong) AVAudioRecorder *recorder;

/** 更新图片的代理 */
@property (nonatomic, assign) id<RecordDelegate> delegate;

@end
