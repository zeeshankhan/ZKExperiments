//
//  TableRotateVC.m
//  ZKExperiments
//
//  Created by Zeeshan Khan on 29/05/15.
//  Copyright (c) 2015 Zeeshan Khan. All rights reserved.
//

#import "TableRotateVC.h"

@interface TableRotateVC ()
@property (nonatomic, strong) NSArray *arrRows;
@end

@implementation TableRotateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Rotate";
    
    self.tblRotate.layer.transform = CATransform3DRotate( CATransform3DIdentity,-1.57079633,0,0,1);
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    self.tblRotate.frame = CGRectMake(0, 0, width, width);
    self.tblRotate.rowHeight = width;
//    self.tblRotate.pagingEnabled = YES;
    self.tblRotate.showsHorizontalScrollIndicator = NO;
    self.tblRotate.showsVerticalScrollIndicator = NO;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Text" ofType:@"txt"];
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    self.arrRows = [text componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrRows.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.layer.transform = CATransform3DRotate( CATransform3DIdentity,1.57079633,0,0,1);
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", indexPath.row];
    cell.detailTextLabel.text = [self.arrRows objectAtIndex:indexPath.row];
    return cell;
}

@end
