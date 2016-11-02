//
//  Attendee.h
//  MeetGeek
//
//  Created by Julianne on 10/23/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface Attendee : NSObject

@property (nonatomic, strong) Event *event;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *comment;

- (instancetype) initWithEvent:(Event*)event name:(NSString*)name age:(NSString*)age sex:(NSString*)sex;

@end
