//
//  ViewController.m
//  MeetGeek
//
//  Created by Julianne on 10/15/16.
//  Copyright © 2016 Julianne Goyena. All rights reserved.
//

#import "ViewController.h"
#import "EventTableViewCell.h"
#import "Constants.h"
#import "Event.h"
#import "SignUpViewController.h"

@interface ViewController ()

@property (nonatomic) SeatGeekNetworking *seatGeekNetworking;
@property (nonatomic) NSMutableArray *eventsList;

@end

@implementation ViewController

static NSString *const reuseIdentifier = @"EventCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    
    self.seatGeekNetworking = [[SeatGeekNetworking alloc] init];
    self.seatGeekNetworking.delegate = self;
}

- (IBAction)attendeeListButtonClicked:(id)sender {
    
    [self.navigationController performSegueWithIdentifier:@"AttendeeListSegue" sender:self];
}


- (IBAction)searchButton:(id)sender {
    
    // Search button takes location texts and sends api call
    NSString *searchString = self.input.text;
    NSString *query = [searchString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    [self.seatGeekNetworking requestEventDataWithQuery:query];
}

- (void)dataRequestDidFinishLoading:(NSMutableArray *)array {
    self.eventsList = array;
    [self.tableView reloadData];
}


#pragma mark -  Table View Data Source

- (NSInteger)tableView:(UITableView * )tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.eventsList.count;
}

- (UITableViewCell * )tableView:(UITableView * )tableView cellForRowAtIndexPath:(NSIndexPath * )indexPath{
    
    EventTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    
    Event *event = self.eventsList[indexPath.row];
    cell.title.text = event.name;
    cell.time.text = event.time;
    cell.image.image = event.image;
    
    return cell;
}


#pragma mark - Table View Delegate

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath * )indexPath{
    
    Event *event = self.eventsList[indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    SignUpViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"SignUp"];
    view.event = event;
    
    [self.navigationController pushViewController:view animated:YES];
}


@end
