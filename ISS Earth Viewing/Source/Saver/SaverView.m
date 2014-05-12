//
//  SaverView.m
//  ISS Earth Viewing
//
//  Created by Rafał Grodziński on 11.05.2014.
//  Copyright (c) 2014 UnalignedByte. All rights reserved.
//

#import "SaverView.h"

#import "CameraView.h"


@interface SaverView ()

@property (nonatomic, strong) CameraView *cameraView;

@end

@implementation SaverView

#pragma mark - Initialization
- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if(self == nil)
        return nil;

    [self setAnimationTimeInterval:1/30.0];
    self.cameraView = [[CameraView alloc] initWithFrame:frame];
    [self addSubview:self.cameraView];
    
    return self;
}


- (void)startAnimation
{
    [super startAnimation];
}


- (void)stopAnimation
{
    [super stopAnimation];
}


#pragma mark - Internal Control
- (BOOL)hasConfigureSheet
{
    return NO;
}


#pragma mark - Drawing
- (void)animateOneFrame
{
    return;
}


- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

@end
