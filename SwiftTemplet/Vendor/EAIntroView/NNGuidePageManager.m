//
//  NNGuidePageManager.m
//  EAIntroView
//
//  Created by Bin Shang on 2020/7/14.
//  Copyright © 2020 SampleCorp. All rights reserved.
//

#import "NNGuidePageManager.h"

NSString * const kDefaultGuideViewHide = @"0";

NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";


@interface NNGuidePageManager () <EAIntroDelegate>

@property (nonatomic, strong) UIView *rootView;
@property (nonatomic, strong) EAIntroView *intro;

@end


@implementation NNGuidePageManager

- (void)showGuideView {
    NSString *hide = [NSUserDefaults.standardUserDefaults objectForKey:kDefaultGuideViewHide];
    if ([hide isEqualToString:@"1"]) {
//        return;
    }
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];

    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDescription2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];

    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];

    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];

    
    UIWindow *keyWindow = UIApplication.sharedApplication.keyWindow;
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:keyWindow.bounds andPages:@[page1,page2,page3,page4]];
//    intro.skipButtonAlignment = EAViewAlignmentCenter;
    intro.skipButtonY = 80.f;
    intro.pageControlY = 42.f;
    
    intro.skipButton.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    intro.skipButton.layer.borderColor = UIColor.whiteColor.CGColor;
    intro.skipButton.layer.borderWidth = 1;
    intro.skipButton.layer.cornerRadius = 4;
    
    intro.delegate = self;
    [intro showInView:keyWindow animateDuration:0.3];
}

#pragma mark - EAIntroView delegate

- (void)introDidFinish:(EAIntroView *)introView wasSkipped:(BOOL)wasSkipped {
    if(wasSkipped) {
        NSLog(@"Intro skipped");
    } else {
        NSLog(@"Intro finished");
    }
    
    [NSUserDefaults.standardUserDefaults setObject:@"1" forKey:kDefaultGuideViewHide];
    [NSUserDefaults.standardUserDefaults synchronize];
    
    NSLog(@"%@: hide:%@", NSStringFromSelector(_cmd), [NSUserDefaults.standardUserDefaults objectForKey:kDefaultGuideViewHide]);
}

@end
