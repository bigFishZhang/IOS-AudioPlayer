//
//  CommonUtil.m
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import "CommonUtil.h"

@implementation CommonUtil
+ (NSString *)bundlePath:(NSString *)fileName
{
    return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
    
}

+ (NSString *)documentsPath:(NSString *)fileName
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}


@end
