//
//  CameraView.m
//  ISS Earth Viewing
//
//  Created by Rafał Grodziński on 11.05.2014.
//  Copyright (c) 2014 UnalignedByte. All rights reserved.
//

#import "CameraView.h"

static NSString *ustreamApiUrl = @"http://static-cdn1.ustream.tv/js/libs/ustream-embedapi.js";
static NSString *baseUrl = @"http://www.ustream.tv/embed/";
//static NSString *videoId = @"17074538";
static NSString *videoId = @"1524";

static NSInteger xMargin = 8.0;
static NSInteger yMargin = 9.0;
static NSInteger extraBarHeight = 36.0;
static NSInteger controlBarHeight = 34.0;


@interface CameraView ()

@property (nonatomic, strong) NSClipView *clipView;
@property (nonatomic, strong) WebView *webView;

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


- (void)setupViews
{
    //calculate video height (width is width of the frame)
    CGFloat videoHeight = (self.frame.size.width*9.0)/16.0;

    //crate web view holding video
    self.webView = [[WebView alloc] initWithFrame:NSMakeRect(0.0, 0.0, self.frame.size.width+xMargin+1.0, videoHeight + yMargin + extraBarHeight*2.0 + controlBarHeight)];
    [[self.webView mainFrame] frameView].allowsScrolling = NO;
    
    NSString *sourceHtml = [NSString stringWithFormat:@"<html><head><script src=\"%@\"></script></head><body><iframe width=\"%ld\" height=\"%ld\" src=\"%@%@?autoplay=1\" style=\"border: 0px;\"></iframe></body></html>",
                            ustreamApiUrl, (long)self.frame.size.width, (long)self.frame.size.height, baseUrl, videoId];
    
    [[self.webView mainFrame] loadHTMLString:sourceHtml baseURL:[NSURL URLWithString:baseUrl]];
    
    //setup clip view and scroll it
    self.clipView = [[NSClipView alloc] initWithFrame:NSMakeRect(0.0, (self.frame.size.height - videoHeight)*0.5,
                                                                 self.frame.size.width, videoHeight)];
    [self.clipView setDocumentView:self.webView];
    [self.clipView scrollToPoint:NSMakePoint(xMargin, -extraBarHeight)];// -controlBarHeight - extraBarHeight - 1)];
    [self addSubview:self.clipView];
}


- (BOOL)inLiveResize
{
    return YES;
}

@end
