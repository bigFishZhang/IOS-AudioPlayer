//
//  AVAudioSession+RouteUtils.h
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface AVAudioSession (RouteUtils)

//是否使用蓝牙
- (BOOL)usingBlueTooth;
//是否使用有线麦克风
- (BOOL)usingWiredMicrophone;
//只要不是用手机内置的听筒或者喇叭作为声音外放，都认为是带了耳机
- (BOOL)shouldShowEarphoneAlert;
@end


