//
//  ELAudioSession.m
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import "ELAudioSession.h"
#import "AVAudioSession+RouteUtils.h"

const NSTimeInterval AUSAudioSessionLatency_Background = 0.0929;
const NSTimeInterval AUSAudioSessionLatency_Default = 0.0232;
const NSTimeInterval AUSAudioSessionLatency_LowLatency = 0.0058;

@implementation ELAudioSession

+ (ELAudioSession *)sharedInstance{
    static ELAudioSession *instance = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ELAudioSession alloc] init];
    });
    return instance;
}

- (instancetype)init{
    if ((self = [super init])) {
        //设置默认的采样率
        _preferredSampleRate = _currentSampleRate = 44100.0;
        
        _audioSession = [AVAudioSession sharedInstance];
    }
    return self;
}

//根据需要设置会话类型
- (void)setCategory:(NSString *)category{
    _category = category;
    NSError *error = nil;
    if (![self.audioSession setCategory:_category error:&error]) {
        NSLog(@" set category failed on audio session ! :%@",error.localizedDescription);
    }
    
}

//激活会话
- (void)setActive:(BOOL)active{
    _active = active;
    NSError *error = nil;
    //设置参照采样率
    if (![self.audioSession setPreferredSampleRate:self.preferredSampleRate error:&error]) {
        NSLog(@"error when setPreferredSampleRate on audio session :%@ ",error.localizedDescription);
    }
    //激活会话
    if (![self.audioSession setActive:_active error:&error]) {
        NSLog(@"error when setActive on audio session :%@ ",error.localizedDescription);
    }
    _currentSampleRate = [self.audioSession sampleRate];
    
}

//设置I/O的Buffer buffer越小延迟越低
- (void)setPreferredLatency:(NSTimeInterval)preferredLatency{
    _preferredLatency = preferredLatency;
    NSError *error = nil;
    if (![self.audioSession setPreferredIOBufferDuration:_preferredSampleRate error:&error]) {
        NSLog(@"error when setting preferred I/O buffer duration");
    }
}

//监听RouteChange事件
- (void)addRouteChangeListener{
    [[NSNotificationCenter defaultCenter] addObserver:self     selector:@selector(onNotificationAudioRouteChange:)
                                                 name:AVAudioSessionRouteChangeNotification
                                               object:nil];
    [self adjustOnRouteChange];
}

#pragma mark ——— notification observer
- (void)onNotificationAudioRouteChange:(NSNotification *)sender{
    [self adjustOnRouteChange];
}

- (void)adjustOnRouteChange{
    AVAudioSessionRouteDescription *currentRoute = [[AVAudioSession sharedInstance] currentRoute];
    if (currentRoute) {
        if (![[AVAudioSession sharedInstance] usingWiredMicrophone] ) {
            if (![[AVAudioSession sharedInstance] usingBlueTooth]) {
                //强制设置为扬声器播放
                [[AVAudioSession sharedInstance] overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
            }
        }
    }
    
    
}

@end
