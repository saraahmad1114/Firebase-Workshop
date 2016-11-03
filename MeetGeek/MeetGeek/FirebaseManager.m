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
@property (strong, nonatomic) FIRDatabaseReference *ref;


@end

@implementation FirebaseManager

+ (id)sharedManager {
    static FirebaseManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ref = [[FIRDatabase database]reference];
        self.Attendees = [NSMutableArray new];
        [self setupObservers];
    }
    return self;
}



- (void)postAttendee:(Attendee*)attendee
{
    //creating a dictionary of attendees info
    
    NSMutableDictionary *postDictionary = [NSMutableDictionary dictionaryWithDictionary:@{kEventId: @(attendee.event.eventId),
                                                                                       kEventName: attendee.event.name,
                                                                                       kUserName: attendee.name,
                                                                                       kUserAge: attendee.age,
                                                                                       kUserSex: attendee.sex,
                                                                                       }];
    if (attendee.comment.length > 0)
    {
        [postDictionary setValue:attendee.comment forKey:kUserComment];
    }
    //sending to firebase
    FIRDatabaseReference *attendeeReference = [self.ref childByAutoId];
    
    //childByAutoId - something that comes along with firebase
    //generates a random id so that you have a unique id and hence you have a nsdictionary
    //firebase requires you to have a nsdictionary
    
    [attendeeReference setValue:postDictionary];
}

- (Attendee*)createAttendee:(NSDictionary*)dictionary
{
    Event *event = [[Event alloc] init];
    event.name = dictionary[kEventName];
    
    NSString *userName = dictionary[kUserName];
    NSString *userAge = dictionary[kUserAge];
    NSString *userSex = dictionary[kUserSex];
    NSString *userComment = dictionary[kUserComment];
    
    Attendee *attendee = [[Attendee alloc] initWithEvent:event name:userName age:userAge sex:userSex];
    attendee.comment = userComment;
    
    return attendee;
}



- (void)setupObservers
{
    //firebase communication
    //realtime database, don't need any get request but sets observers or listeners
    //Observe the following conditions: adding, moving or deleting
    [self.ref observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        //creating an attendee object from firebase data
        Attendee *attendee = [self createAttendee:snapshot.value];
        
        [self.attendees addObject:attendee];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(reloadData)]){
            [self.delegate reloadRequests]; 
        }
        
    }];
}


@end
