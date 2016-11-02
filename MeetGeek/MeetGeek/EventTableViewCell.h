//
//  EventTableViewCell.h
//  MeetGeek
//
//  Created by Julianne on 10/15/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UIImageView *image;

@end
