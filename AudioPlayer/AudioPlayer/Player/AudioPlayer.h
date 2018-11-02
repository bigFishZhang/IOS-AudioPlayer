//
//  AudioPlayer.h
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AudioPlayer : NSObject

- (id)initWithFilePath:(NSString *)filePath;

- (void)start;

- (void)stop;
@end


