//
//  FirebaseManager.h
//  MeetGeek
//
//  Created by Julianne on 11/2/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attendee.h"

@protocol FirebaseManagerDelegate <NSObject>

- (void)reloadRequests;

@end

@interface FirebaseManager : NSObject

@property (nonatomic, weak) id <FirebaseManagerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray<Attendee*> *attendees;

+ (id)sharedManager; 
- (void)postAttendee:(Attendee*)attendee; 
@end
