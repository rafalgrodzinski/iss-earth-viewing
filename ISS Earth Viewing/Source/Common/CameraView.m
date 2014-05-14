//
//  CameraView.m
//  ISS Earth Viewing
//
//  Created by Rafał Grodziński on 11.05.2014.
//  Copyright (c) 2014 UnalignedByte. All rights reserved.
//

#import "CameraView.h"

static NSString *baseUrl = @"http://www.ustream.tv/embed/";
static NSString *videoId = @"17074538";

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


- (void)awakeFromNib
{
    [self setupViews];
}


- (void)setupViews
{
    //calculate video height (width is width of the frame)
    CGFloat videoHeight = (self.frame.size.width*9.0)/16.0;
    CGFloat videoFrameHeight = videoHeight+yMargin+controlBarHeight+extraBarHeight*2;

    //crate web view holding video
    self.webView = [[WebView alloc] initWithFrame:NSMakeRect(0.0, 0.0, self.frame.size.width+xMargin+1.0, videoFrameHeight)];
    [[self.webView mainFrame] frameView].allowsScrolling = NO;
    
    NSString *sourceHtml = [NSString stringWithFormat:@"<html><head></head><body style=\"background-color: #000000;\"><iframe width=\"%ld\" height=\"%ld\" src=\"%@%@?autoplay=1\" style=\"border: 0px;\"></iframe></body></html>",
                            (NSInteger)(self.frame.size.width+xMargin+1.0), (NSInteger)videoFrameHeight, baseUrl, videoId];
    
    [[self.webView mainFrame] loadHTMLString:sourceHtml baseURL:[NSURL URLWithString:baseUrl]];
    
    //setup clip view and scroll it
    self.clipView = [[NSClipView alloc] initWithFrame:NSMakeRect(0.0, (self.frame.size.height - videoHeight)*0.5,
                                                                 self.frame.size.width, videoHeight)];
    [self addSubview:self.clipView];
    [self.clipView setDocumentView:self.webView];
    [self.clipView scrollToPoint:NSMakePoint(xMargin+1, controlBarHeight+extraBarHeight-3.0)];
}

@end
