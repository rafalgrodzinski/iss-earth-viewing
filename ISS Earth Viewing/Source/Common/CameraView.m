//
//  CameraView.m
//  ISS Earth Viewing
//
//  Created by Rafał Grodziński on 11.05.2014.
//  Copyright (c) 2014 UnalignedByte. All rights reserved.
//

#import "CameraView.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


static NSString *videoId = @"17074538";

 
@interface CameraView ()

@property (nonatomic, strong) AVPlayerView *avPlayerView;

@end


@implementation CameraView

#pragma mark - Initialization
- (id)initWithFrame:(NSRect)frame_
{
    self = [super initWithFrame:frame_];
    if(self == nil)
        return nil;
    
    [self setupViews];
    
    return self;
}


- (void)awakeFromNib
{
    [self setupViews];
}


- (void)setupViews
{
    self.avPlayerView = [[AVPlayerView alloc] initWithFrame:self.frame];
    self.avPlayerView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    self.avPlayerView.controlsStyle = AVPlayerViewControlsStyleNone;
    NSString *streamUrlString = [NSString stringWithFormat:@"http://iphone-streaming.ustream.tv/uhls/%@/streams/live/iphone/playlist.m3u8", videoId];
    self.avPlayerView.player = [AVPlayer playerWithURL:[NSURL URLWithString:streamUrlString]];
    [self.avPlayerView.player play];
    [self addSubview:self.avPlayerView];
}

@end
