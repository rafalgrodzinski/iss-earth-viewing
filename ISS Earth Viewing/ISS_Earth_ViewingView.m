//
//  ISS_Earth_ViewingView.m
//  ISS Earth Viewing
//
//  Created by Rafał Grodziński on 11.05.2014.
//  Copyright (c) 2014 UnalignedByte. All rights reserved.
//

#import "ISS_Earth_ViewingView.h"

@implementation ISS_Earth_ViewingView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
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

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
