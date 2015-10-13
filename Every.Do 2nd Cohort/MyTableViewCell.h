//
//  MyTableViewCell.h
//  Every.Do 2nd Cohort
//
//  Created by Yazan Khayyat on 2015-10-13.
//  Copyright © 2015 Yazan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLevelLabel;

@end
