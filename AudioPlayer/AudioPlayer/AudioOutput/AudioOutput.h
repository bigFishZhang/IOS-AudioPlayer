//
//  AudioOutput.h
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FillDataDelegate <NSObject>

- (NSInteger)fillAudioData:(SInt16 *)sampleBuffer
                 numFrames:(NSInteger)fremeNum
               numChannels:(NSInteger)channels;


@end

@interface AudioOutput : NSObject

@property(nonatomic, assign) Float64 sampleRate;

@property(nonatomic, assign) Float64 channels;

- (id) initWithChannels:(NSInteger)channels
             sampleRate:(NSInteger)sampleRate
         bytesPerSample:(NSInteger)bytePerSample
      filleDataDelegate:(id<FillDataDelegate>)fillAudioDataDelegate;

- (BOOL) play;
- (void) stop;

@end


