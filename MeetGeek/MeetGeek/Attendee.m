//
//  Attendee.m
//  MeetGeek
//
//  Created by Julianne on 10/23/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import "Attendee.h"

@implementation Attendee

- (instancetype) initWithEvent:(Event*)event name:(NSString*)name age:(NSString*)age sex:(NSString*)sex
{
    self = [super init];
    if (self)
    {
        _event = event;
        _name =  name;
        _age = age;
        _sex = sex;
    }
    return self;
}

@end
