//
//  AVAudioSession+RouteUtils.m
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import "AVAudioSession+RouteUtils.h"

@implementation AVAudioSession (RouteUtils)

- (BOOL)usingBlueTooth{
    NSArray *inputs = self.currentRoute.inputs;
    NSArray *blueToothInputRoutes = @[AVAudioSessionPortBluetoothHFP];
    for (AVAudioSessionPortDescription *description in inputs) {
        if ([blueToothInputRoutes containsObject:description.portType]) {
            return YES;
        }
    }
    
    NSArray *outputs = self.currentRoute.outputs;
    NSArray *blueToothOutputRoutes = @[AVAudioSessionPortBluetoothHFP, AVAudioSessionPortBluetoothA2DP, AVAudioSessionPortBluetoothLE];
    for (AVAudioSessionPortDescription *description in outputs) {
        if ([blueToothOutputRoutes containsObject:description.portType]) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)usingWiredMicrophone{
    NSArray *inputs = self.currentRoute.inputs;
    NSArray *headSetInputRoutes = @[AVAudioSessionPortHeadsetMic];
    for (AVAudioSessionPortDescription *description in inputs) {
        if ([headSetInputRoutes containsObject:description.portType]) {
            return YES;
        }
    }
    
    NSArray *outputs = self.currentRoute.outputs;
    NSArray *headSetOutputRoutes = @[AVAudioSessionPortHeadphones, AVAudioSessionPortUSBAudio];
    for (AVAudioSessionPortDescription *description in outputs) {
        if ([headSetOutputRoutes containsObject:description.portType]) {
            return YES;
        }
    }
    return NO;
    
}

//只要不是用手机内置的听筒或者喇叭作为声音外放，都认为是带了耳机
- (BOOL)shouldShowEarphoneAlert{
    NSArray *outputs = self.currentRoute.outputs;
    //内置听筒，喇叭
    NSArray *headSetOutputRoutes = @[AVAudioSessionPortBuiltInReceiver, AVAudioSessionPortBuiltInSpeaker];
    for (AVAudioSessionPortDescription *description in outputs) {
        if ([headSetOutputRoutes containsObject:description.portType]) {
            return YES;
        }
    }
    return NO;
}

@end
