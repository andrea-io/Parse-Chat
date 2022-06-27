//
//  ChatViewController.h
//  Parse Chat
//
//  Created by Andrea Gonzalez on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *sendMessageButton;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@end

NS_ASSUME_NONNULL_END
