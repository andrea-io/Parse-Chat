//
//  ViewController.m
//  Parse Chat
//
//  Created by Andrea Gonzalez on 6/27/22.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)loginUser:(id)sender {
    
}

- (IBAction)registerUser:(id)sender {
    // Initialize a user object
    PFUser *newUser = [PFUser user];
    
    // Set user properties
    newUser.username = self.userNameTextField.text;
    // newUser.email = self.emailField.text;
    newUser.password = self.passwordTextField.text;
        
    // Call sign up function on the user object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            // Manually segue to logged in view
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
