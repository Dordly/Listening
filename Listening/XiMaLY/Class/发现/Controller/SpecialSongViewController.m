//
//  SpecialSongViewController.m
//  Listening
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 Dordly. All rights reserved.
//

#import "SpecialSongViewController.h"
#import "SpecialTitleViewCell.h"
#import "BaseNetManager.h"
#import "MusicDetailCell.h"
#import "MoreCategoryCell.h"
#import "DestinationViewController.h"

@interface SpecialSongViewController ()
<
UITableViewDataSource,UITableViewDelegate,
MusicDetailCellDelegate,
NSURLSessionDelegate
>
{
    NSUInteger _pageId;
    NSUInteger _page;
    NSUInteger _countPage;
    NSUInteger _albumTotalCount;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,readwrite,strong) NSMutableArray *downloadList;
@property (nonatomic,readwrite,strong) NSDictionary *infoDict;
@property (nonatomic,readwrite,strong) NSArray *listArray;

@property (nonatomic,readwrite,strong) NSMutableDictionary *downloadDict;

@end

static NSString *const titleCellIdentifier = @"SpecialTitleViewCell";
static NSString *const tracksCellIdentifier = @"MusicDetailCell";
static NSString *const categoryCellIdentifier = @"MoreCategoryCell";

@implementation SpecialSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.downloadList = [NSMutableArray array];
    
    self.navigationItem.title = NSLocalizedString(_specialTitle, nil);
    
    [self getSpecialDetailFormService];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SpecialTitleViewCell" bundle:nil] forCellReuseIdentifier:titleCellIdentifier];
    [self.tableView registerClass:[MoreCategoryCell class] forCellReuseIdentifier:categoryCellIdentifier];
    [self.tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:tracksCellIdentifier];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return section ? _listArray.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.section) {
        if ([_infoDict[@"contentType"] integerValue] == 1) {
            MoreCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryCellIdentifier forIndexPath:indexPath];
            
            [cell.coverBtn setImageForState:(UIControlStateNormal) withURL:[NSURL URLWithString:_listArray[indexPath.row][@"albumCoverUrl290"]] placeholderImage:[UIImage imageNamed:@"album_cover_bg"]];
            
            cell.titleLb.text = _listArray[indexPath.row][@"title"];
            cell.introLb.text = _listArray[indexPath.row][@"intro"];
            
            NSInteger playsCount = [_listArray[indexPath.row][@"playsCounts"] integerValue];
            NSString *playsCountStr = nil;
            if (playsCount>10000) {
                playsCountStr = [NSString stringWithFormat:@"%.2f万",playsCount/10000.0];
            } else {
                 playsCountStr = [NSString stringWithFormat:@"%ld",(long)playsCount];
            }
            
            cell.playsLb.text = playsCountStr;
            cell.tracksLb.text = [_listArray[indexPath.row][@"tracksCounts"] stringValue];
            return cell;
        } else {
        MusicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:tracksCellIdentifier forIndexPath:indexPath];
            cell.delegate = self;
            cell.indexPath = indexPath;
        [cell bindAnchorTracksData:_listArray[indexPath.row]];
        return cell;
        }
    } else {
        
        SpecialTitleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier forIndexPath:indexPath];
        
        [cell bindCellContentData:_infoDict];
        return cell;
    }
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.section) {
        NSString *content = _infoDict[@"intro"];
        CGFloat autoHeight = [content boundingRectWithSize:CGSizeMake(kScreenWidth-40, kScreenHeight) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
        return autoHeight + 30 + 110;
    } else {
    
        return 80;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return !section ? 10 : 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section) {
        
        if ([_infoDict[@"contentType"] integerValue] == 1) {
            // 从本控制器VM获取头标题, 以及分类ID回初始化
            DestinationViewController *vc = [[DestinationViewController alloc] initWithAlbumId:[_listArray[indexPath.row][@"id"] integerValue] title:_listArray[indexPath.row][@"title"]];
            // 隐藏状态栏及底部栏
            vc.hidesBottomBarWhenPushed = YES;
            self.navigationController.navigationBar.hidden = YES;
            [self.navigationController pushViewController:vc animated:YES];
            
        } else {
            
            NSURL *coverURL =  [NSURL URLWithString:_listArray[indexPath.row][@"coverSmall"]];
            NSURL *musicURL =  [NSURL URLWithString:_listArray[indexPath.row][@"playPath64"]];
            // 通知按钮旋转,播放及按钮改变
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[@"coverURL"] = coverURL;
            userInfo[@"musicURL"] = musicURL;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"BeginPlay" object:nil userInfo:[userInfo copy]];
        }
    }
}
#pragma mark - MusicDetailCellDelegate
- (void)musicDetailCellDidClickDownloadButton:(NSIndexPath *)indexPath {
    // 开始下载
    NSLog(@"即将开始下载：%@",_listArray[indexPath.row][@"title"]);
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    //create url for download
    NSURL *downloadURL = [NSURL URLWithString:_listArray[indexPath.row][@"playPath32"]];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:downloadURL];
    
    //trigger downloadtask
    [downloadTask resume];
    
    
    self.downloadDict = [NSMutableDictionary dictionaryWithDictionary:_listArray[indexPath.row]];

    // 启动任务
    [downloadTask resume];
    
}

#pragma mark - NSURLSessionDelegate
//下载完成后调用
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSString *fullPath = [cachesPath stringByAppendingPathComponent:@"downloadList.plist"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
//    NSLog(@"%@\n%@",cachesPath,location.path);
    
    //AtPath:当前路径  toPath:欲移动的目的路径
    if ([manager moveItemAtPath:location.path toPath:fullPath error:nil]) {
        [self.downloadDict setObject:fullPath forKey:@"downloadPath"];
        [self.downloadList addObject:_downloadDict];
        
        NSString *documPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        
        NSString *filePath = [documPath stringByAppendingPathComponent:@"downloadList.plist"];
        
        [self.downloadList writeToFile:filePath atomically:YES];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabelText = NSLocalizedString(@"音频下载成功！", nil);
        [hud hide:YES afterDelay:1];
    };
    
    
}

#pragma mark - Services

// http://mobile.ximalaya.com/m/subject_detail?device=android&id=558&position=1&title=%E6%84%9A%E2%80%9D%E4%BD%A0%E5%90%8C%E4%B9%90%EF%BC%81%E6%9C%89%E5%BD%A9%E8%9B%8B%EF%BC%81
/**  从服务器端获取数据 */
- (void)getSpecialDetailFormService {
    
    NSString *url = [NSString stringWithFormat:@"http://mobile.ximalaya.com/m/subject_detail?device=android&id=%ld&position=1&title=%@",(long)_specialId,_specialTitle];
    
    NSString *encodURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [[BaseNetManager defaultManager] GET:encodURL parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            _infoDict = responseObject[@"info"];
            
            _listArray = responseObject[@"list"];
            
            [self.tableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabelText = NSLocalizedString(@"欢迎回来！", nil);
        [hud hide:YES afterDelay:1];
        
    }];
    
}

@end
