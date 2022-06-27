//
//  ChatViewController.m
//  Parse Chat
//
//  Created by Andrea Gonzalez on 6/27/22.
//

#import "ChatViewController.h"
#import "ChatCell.h"
#import <Parse/Parse.h>

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *chatTableView;
@property (nonatomic, strong) NSArray *messages;

@end

@implementation ChatViewController

- (IBAction)sendMessageButton:(id)sender {
    PFObject *chatMessage = [PFObject objectWithClassName:@"Message_FBU2021"];
    
    // Retrieve the text message the user typed
    chatMessage[@"text"] = self.messageTextField.text;
    
    // Call saveInBackground(block:) and print when the message successfully saves or produces any errors.
    [chatMessage saveInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (succeeded) {
            NSLog(@"The message was saved!");
            
            // Clear the text from the text chat field on successful message save
            chatMessage[@"text"] = @"";
        } else {
            NSLog(@"Problem saving message: %@", error.localizedDescription);
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.chatTableView.delegate = self;
    self.chatTableView.dataSource = self;
    self.chatTableView.rowHeight = UITableViewAutomaticDimension;
    
}

- (void)onTimer {
   // Add code to be run periodically
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    <#code#>
//}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

@end
