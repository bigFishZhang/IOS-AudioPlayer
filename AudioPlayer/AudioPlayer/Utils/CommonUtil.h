//
//  CommonUtil.h
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtil : NSObject

+ (NSString *)bundlePath:(NSString *)fileName;
+ (NSString *)documentsPath:(NSString *)fileName;

@end

