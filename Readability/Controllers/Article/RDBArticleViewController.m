//
//  RDBArticleViewController.m
//  Readability
//
//  Created by KIET NGUYEN on 4/23/14.
//  Copyright (c) 2014 Kiet Nguyen. All rights reserved.
//

#import "RDBArticleViewController.h"

@interface RDBArticleViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSString *htmlString;
@end

@implementation RDBArticleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView.delegate =self;
    
    UIBarButtonItem *reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStyleBordered target:self action:@selector(reloadButtonClicked:)];
    self.navigationItem.rightBarButtonItem = reloadButton;

    NSURL *articleURL = [[NSURL alloc] initWithString:LINK_ARTICLE];
    NSError *error;
    self.htmlString = [NSString stringWithContentsOfURL:articleURL
                                                    encoding:NSUTF8StringEncoding
                                                       error:&error];
    if (error) {
        NSLog(@"Load HTML has some errors: %@",[error localizedDescription]);
    }
    else{
        
        NSString *jqueryPath = [[NSBundle mainBundle] pathForResource:@"readability" ofType:@"js"];
        NSString *readabilityJSPath = [[NSBundle mainBundle] pathForResource:@"readability" ofType:@"js"];
        
        // Add ref js
        NSString *refJSString = [NSString stringWithFormat:@"<head> <script src='%@' type='text/javascript' charset='utf-8'></script>  <script src='%@' type='text/javascript' charset='utf-8'></script>", jqueryPath, readabilityJSPath];
        self.htmlString = [self.htmlString stringByReplacingOccurrencesOfString:@"<head>" withString:refJSString];
        
        // Call js function
        self.htmlString = [self.htmlString stringByReplacingOccurrencesOfString:@"</html>" withString:@"</html><script>$(function(){ readability.init();$('img').attr('style','width:100%');$('.Image').attr('style','font-size:9px'); })</script>"];
        
        // Load HTML
        [self.webView loadHTMLString:self.htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    }
}


#pragma mark - UIWebview Delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if (!error) {
        NSLog(@"Load successfully!");
    }
    else{
        NSLog(@"Loading has some errors: %@ %@", [error localizedDescription], [error localizedFailureReason]);
    }
}

#pragma mark - Actions

- (void)reloadButtonClicked: (id)sender
{
     NSLog(@"%@", self.htmlString);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
