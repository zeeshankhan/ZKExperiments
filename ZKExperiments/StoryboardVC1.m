//
//  StoryboardVC1.m
//  ZKExperiments
//
//  Created by Zeeshan Khan on 29/05/15.
//  Copyright (c) 2015 Zeeshan Khan. All rights reserved.
//

#import "StoryboardVC1.h"
#import "TableViewCell.h"

@interface StoryboardVC1 ()
@property (nonatomic, strong) NSArray *arrRows;

@end

@implementation StoryboardVC1

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"With Autolayout";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Text" ofType:@"txt"];
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    self.arrRows = [text componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    // It only works for Basic type cell. without autolayout
    self.tblStory.estimatedRowHeight = 160.0;
    self.tblStory.rowHeight = UITableViewAutomaticDimension;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStyleDone target:self action:@selector(dismissStoryboard)];
}

- (void)dismissStoryboard {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrRows.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.lblTitle.text = [NSString stringWithFormat:@"Row %ld", indexPath.row];
    cell.lblDesc.text = [self.arrRows objectAtIndex:indexPath.row];
    return cell;
}

//- (void)

@end
