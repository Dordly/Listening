//
//  TapeViewController.m
//  Listening
//
//  Created by Apple on 16/5/9.
//  Copyright © 2016年 HansRove. All rights reserved.
//

#import "TapeViewController.h"
#import "RecordTool.h"

@interface TapeViewController ()<RecordDelegate>
@property (weak, nonatomic) IBOutlet UIButton *listenButton;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *recordAction;
/**录音工具*/
@property (nonatomic, strong)RecordTool * recordTool;

@end

@implementation TapeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化监听事件
    [self setUp];
}
-(void)setUp
{
    self.recordTool.delegate = self;
    //录音按钮
    [self.recordAction addTarget:self action:@selector(recordButtonDidTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self.recordAction addTarget:self action:@selector(recordButtonDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.recordAction addTarget:self action:@selector(recordButtonDidTouchDragExit:) forControlEvents:UIControlEventTouchDragExit];
    //播放按钮
    [self.listenButton addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark ~~~按钮的点击事件

/**将手指从按钮上移除*/
-(void)recordButtonDidTouchDragExit:(UIButton *)sender
{
    self.titleLabel.text = @"暂停录音";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        [self.recordTool stopRecording];
        [self.recordTool destructionRecordingFile];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self alertWithMessage:@"取消录音"];
        });
    });
}
/**点击*/
-(void)recordButtonDidTouchUpInside:(UIButton *)sender
{
    double currentTime = self.recordTool.recorder.currentTime;
    NSLog(@"%lf",currentTime);
    if(currentTime < 2)
    {
        self.titleLabel.text = @"正在录音";
        [self alertWithMessage:@"录音时间过短"];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            [self.recordTool stopRecording];
            [self.recordTool destructionRecordingFile];
        });
    }
    else
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
                [self.recordTool stopRecording];
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    self.titleLabel.text = @"正在录音";
            });
        });
        
        //已成功录音
        NSLog(@"录音成功");
    }
}
/**按下*/
-(void)recordButtonDidTouchDown:(UIButton *)sender
{
    //开始录音
    [self.recordTool startRecording];
}
- (IBAction)rightAction:(UIButton *)sender
{
    
    
}
- (IBAction)backAction:(UIButton *)sender
{
    
   [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)addoneAction:(UIButton *)sender
{
    
    
}
- (IBAction)addtwoAction:(UIButton *)sender
{
    
    
}
#pragma mark ~~~弹窗提示
-(void)alertWithMessage:(NSString *)message
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    [alert show];
}

#pragma mark ~~~播放录音
-(void)play
{
    [self.recordTool playRecordingFile];
}
-(void)dealloc
{
    [self.recordTool stopPlaying];
    [self.recordTool stopRecording];
}
@end
