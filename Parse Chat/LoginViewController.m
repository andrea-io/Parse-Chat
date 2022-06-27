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
    // Retrieve user-entered username and password from text fields
    NSString *username = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
        
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            // Display view controller that needs to be shown after successful login
        }
    }];
}

- (IBAction)registerUser:(id)sender {
    // Initialize a user object
    PFUser *newUser = [PFUser user];
    
    // Set user properties
    newUser.username = self.userNameTextField.text;
    // newUser.email = self.emailField.text;
    newUser.password = self.passwordTextField.text;
        
    // Call sign up functRion on the user object
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
