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
- (id)initWithFrame:(NSRect)frame_ isPreview:(BOOL)isPreview_
{
    self = [super initWithFrame:frame_ isPreview:isPreview_];
    if(self == nil)
        return nil;

    [self setAnimationTimeInterval:1/60.0];
    self.cameraView = [[CameraView alloc] initWithFrame:frame_];
    [self addSubview:self.cameraView];
    
    return self;
}


#pragma mark - Internal Control
- (BOOL)hasConfigureSheet
{
    return NO;
}


#pragma mark - Drawing
- (void)drawRect:(NSRect)rect_
{
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, NSRectToCGRect(rect_));
}

@end
