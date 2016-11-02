//
//  FirebaseManager.m
//  MeetGeek
//
//  Created by Julianne on 11/2/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import "FirebaseManager.h"
#import "Constants.h"
@import Firebase;

@interface FirebaseManager()


@end

@implementation FirebaseManager

//+ (id)sharedManager {
//    static FirebaseManager *sharedMyManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedMyManager = [[self alloc] init];
//    });
//    return sharedMyManager;
//}


//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}



//- (void)postAttendee:(Attendee*)attendee
//{
//    NSMutableDictionary *postDictionary = [NSMutableDictionary dictionaryWithDictionary:@{kEventId: @(attendee.event.eventId),
//                                                                                       kEventName: attendee.event.name,
//                                                                                       kUserName: attendee.name,
//                                                                                       kUserAge: attendee.age,
//                                                                                       kUserSex: attendee.sex,
//                                                                                       }];
//    if (attendee.comment.length > 0)
//    {
//        [postDictionary setValue:attendee.comment forKey:kUserComment];
//    }
//    
//}

//- (Attendee*)createAttendee:(NSDictionary*)dictionary
//{
//    Event *event = [[Event alloc] init];
//    event.name = dictionary[kEventName];
//    
//    NSString *userName = dictionary[kUserName];
//    NSString *userAge = dictionary[kUserAge];
//    NSString *userSex = dictionary[kUserSex];
//    NSString *userComment = dictionary[kUserComment];
//    
//    Attendee *attendee = [[Attendee alloc] initWithEvent:event name:userName age:userAge sex:userSex];
//    attendee.comment = userComment;
//    
//    return attendee;
//}



//- (void)setupObservers
//{
//
//}


@end
