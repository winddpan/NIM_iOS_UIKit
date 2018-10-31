//
//  NTESSessionViewController.m
//  DemoApplication
//
//  Created by chris on 15/10/7.
//  Copyright © 2015年 chris. All rights reserved.
//

#import "NTESSessionViewController.h"
#import "NTESSessionConfig.h"
#import "NTESAttachment.h"
#import <NIMKit/NIMKit.h>
#import <NIMKit/NIMKitSetting.h>
#import <NIMKit/UIImage+NIMkit.h>
#import <NIMKit/NIMKitDataProviderImpl.h>
#import <NIMKit/NIMBadgeView.h>
#import <NIMKit/NIMAvatarImageView.h>
#import <NIMKit/NIMSessionListCell.h>
#import <NIMKit/NIMSessionTimestampCell.h>
#import <NIMKit/NIMGrowingTextView.h>
#import <NIMKit/NIMSessionInteractorImpl.h>
#import <NIMKit/NIMKitMediaFetcher.h>
#import <NIMKit/NIMMessageMaker.h>
#import <NIMKit/NIMKitTitleView.h>
#import <NIMKit/NIMMessageCell.h>
#import <NIMKit/NIMSessionTextContentView.h>
#import <NIMKit/NIMSessionImageContentView.h>
#import <NIMKit/NIMSessionVideoContentView.h>
#import <NIMKit/NIMSessionAudioContentView.h>
#import <NIMKit/NIMSessionNetChatNotifyContentView.h>
#import <NIMKit/NIMInputMoreContainerView.h>
#import <NIMKit/NIMKitLocationPoint.h>
#import <NIMKit/NIMLocationViewController.h>
#import <NIMKit/M80AttributedLabel+NIMKit.h>

@interface NTESSessionViewController ()

@property (nonatomic,strong) NTESSessionConfig *config;

@end

@implementation NTESSessionViewController

- (instancetype)initWithSession:(NIMSession *)session
{
    self = [super initWithSession:session];
    if (self) {
        _config = [[NTESSessionConfig alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    NIMKitConfig *config = [NIMKitConfig new];
    int number = config.messageInterval;
}

- (NSString *)sessionTitle{
    return @"聊天";
}

- (id<NIMSessionConfig>)sessionConfig{
    return self.config;
}


#pragma mark - Private
- (void)sendCustomMessage{
    //构造自定义内容
    NTESAttachment *attachment = [[NTESAttachment alloc] init];
    attachment.title = @"这是一条自定义消息";
    attachment.subTitle = @"这是自定义消息的副标题";
    
    //构造自定义MessageObject
    NIMCustomObject *object = [[NIMCustomObject alloc] init];
    object.attachment = attachment;
    
    //构造自定义消息
    NIMMessage *message = [[NIMMessage alloc] init];
    message.messageObject = object;
    
    //发送消息
    [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:self.session error:nil];
}

@end
