//
//  ELAudioSession.h
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

extern const NSTimeInterval AUSAudioSessionLatency_Background;
extern const NSTimeInterval AUSAudioSessionLatency_Default;
extern const NSTimeInterval AUSAudioSessionLatency_LowLatency;

@interface ELAudioSession : NSObject

+ (ELAudioSession *)sharedInstance;

/** 底层系统音频会话 */
@property (nonatomic,strong) AVAudioSession * audioSession;
/** 推荐采样率 */
@property (nonatomic,assign) Float64 preferredSampleRate;
/** 当前采样率 */
@property (nonatomic,assign,readonly) Float64 currentSampleRate;
/** 推荐延迟 */
@property (nonatomic,assign) NSTimeInterval preferredLatency;
/** 状态 */
@property (nonatomic,assign) BOOL active;
/** <#注释#> */
@property (nonatomic,strong) NSString * category;
//添加监听
- (void)addRouteChangeListener;

@end


