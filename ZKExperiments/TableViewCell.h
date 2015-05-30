//
//  TableViewCell.h
//  ZKExperiments
//
//  Created by Zeeshan Khan on 29/05/15.
//  Copyright (c) 2015 Zeeshan Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;

@end
