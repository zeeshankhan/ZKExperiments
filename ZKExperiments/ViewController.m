//
//  ViewController.m
//  ZKExperiments
//
//  Created by Zeeshan Khan on 29/05/15.
//  Copyright (c) 2015 Zeeshan Khan. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "DetailVC.h"
#import "TableRotateVC.h"
#import "StoryboardVC1.h"

@interface ViewController () {
    NSInteger cnt;
}
@property (nonatomic, strong) NSArray *arrRows;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Table and Row Height";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Text" ofType:@"txt"];
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    self.arrRows = [text componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Story Board" style:UIBarButtonItemStyleDone target:self action:@selector(rotateAction)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    static UIFont* font;
    static CGRect textFrame;
    static CGFloat extraHeight;
    if( !font) {
        TableViewCell *cell = [self cellForTable:tableView];
        font = cell.lblDesc.font;
        CGRect cellFrame = cell.frame;
        textFrame = cell.lblDesc.frame;
        extraHeight = cellFrame.size.height - textFrame.size.height; // The space above and below the growing field
    }
    
    NSString *txt = [self.arrRows objectAtIndex:indexPath.row];
    CGFloat height = [txt boundingRectWithSize:CGSizeMake(textFrame.size.width, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName: font}
                                              context:nil].size.height;
    height = height + extraHeight + 5;
    return height;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrRows.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [self cellForTable:tableView];
    cell.lblTitle.text = [NSString stringWithFormat:@"Row %ld", indexPath.row];
    cell.lblDesc.text = [self.arrRows objectAtIndex:indexPath.row];
    return cell;
}

- (TableViewCell*)cellForTable:(UITableView*)tableView {
    static NSString *cellIdentifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] firstObject];
//        NSLog(@"Cell Created. %ld", ++cnt);
    }
    return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailVC *vc = [[DetailVC alloc] initWithNibName:@"DetailVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rotateAction {

//    TableRotateVC *vc = [[TableRotateVC alloc] initWithNibName:@"TableRotateVC" bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    StoryboardVC1 *vc = [sb instantiateViewControllerWithIdentifier:@"StoryboardVC1"];
    UINavigationController *navCont = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navCont animated:YES completion:NULL];
    
}

@end
