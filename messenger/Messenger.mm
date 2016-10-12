#import "header/PSListController.h"
#import "header/PSViewController.h"

@interface MessengerListController: PSListController {
}
@end

@implementation MessengerListController

- (void)loadView {
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
}
- (void)shareTapped {
	NSString *text = @"I'm using #Messenger+ By @aboghzayel Download in Cydia on the BigBoss repo!";

	if ([UIActivityViewController alloc]) {
		UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[text] applicationActivities:nil];
		[(UINavigationController *)[super navigationController] presentViewController:activityViewController animated:YES completion:NULL];
	}else {
		//awesomeness
	}
}

-(void)apply {
	 system("killall -9 Messenger");
      } 


- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Messenger" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
