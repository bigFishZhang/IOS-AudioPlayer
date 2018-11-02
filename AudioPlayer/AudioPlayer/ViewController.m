//
//  ViewController.m
//  AudioPlayer
//
//  Created by bigfish on 2018/11/2.
//  Copyright © 2018 bigfish. All rights reserved.
//

#import "ViewController.h"

#import "CommonUtil.h"
#import "AudioPlayer.h"

@interface ViewController ()
@property (strong, nonatomic) AudioPlayer *audioPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clickPlay:(id)sender {
    NSLog(@"Play Music...");
    //    NSString* filePath = [CommonUtil bundlePath:@"131.aac"];
    NSString* filePath = [CommonUtil bundlePath:@"131.aac"];
    self.audioPlayer = [[AudioPlayer alloc] initWithFilePath:filePath];
    [_audioPlayer start];
}

- (IBAction)clickStop:(id)sender {
    NSLog(@"Stop Music...");
    if(_audioPlayer) {
        [_audioPlayer stop];
    }
}

@end
