//
//  SignUpViewController.h
//  MeetGeek
//
//  Created by Julianne on 10/15/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import "ViewController.h"
#import "Attendee.h"

@class Event;

@interface SignUpViewController : ViewController

@property (strong, nonatomic) Event *event;

- (instancetype)init;

@end
