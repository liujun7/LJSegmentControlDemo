//
//  ViewController.m
//  LJSegmentControlDemo
//
//  Created by liujun on 2018/5/17.
//  Copyright © 2018年 liujun. All rights reserved.
//

#import "ViewController.h"
#import "LJSegmentedControl.h"

@interface ViewController () <LJSegmentedControlDelegate>

@property (nonatomic, strong) LJSegmentedControl *segmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 4; i++) {
        LJSegmentedItem *item = [[LJSegmentedItem alloc] init];
        item.title = [NSString stringWithFormat:@"军-%ld", i + 1];
        [items addObject:item];
    }
    
    self.segmentedControl = [[LJSegmentedControl alloc] initWithSegmentedItmes:items];
    self.segmentedControl.frame = CGRectMake(0, 100, self.view.bounds.size.width, 44);
    self.segmentedControl.showIndicator = YES;
    self.segmentedControl.backgroundColor = [UIColor lightGrayColor];
    self.segmentedControl.delegate = self;
    //    UIButton *button = self.segmentedControl.itemButtons.lastObject;
    //    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.segmentedControl.selectedIndex = 0;
    self.segmentedControl.scaleSize = YES;
    //    self.segmentedControl.indicatorHeigLJ = 5;
    //    self.segmentedControl.selectedTitleFontSize = 20;
    //    self.segmentedControl.indicatorPosition = LJSegmentedControlIndicatorPositionTop;
    self.segmentedControl.segmentWidthStyle = LJSegmentedControlSegmentWidthStyleDynamic;
    [self.view addSubview:self.segmentedControl];
}

#pragma mark - LJSegmentedControlDelegate

- (NSArray<LJSegmentedItemAttributes *> *)segmentedControl:(LJSegmentedControl *)segmentedControl segmentedItemAttributesForItems:(NSArray<LJSegmentedItem *> *)items {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    CGFloat w = 75;
    CGFloat width = 150;
    for (NSInteger i = 0; i < items.count; i++) {
        LJSegmentedItemAttributes *itemAttributes = [[LJSegmentedItemAttributes alloc] init];
        if (i == 0) {
            itemAttributes.itemFrame = CGRectMake(0, 0, w, segmentedControl.bounds.size.height);
        } else {
            itemAttributes.itemFrame = CGRectMake(w + width * (i - 1), 0, width, segmentedControl.bounds.size.height);
        }
        [array addObject:itemAttributes];
    }
    return array;
}

- (LJFloatingView *)segmentedControl:(LJSegmentedControl *)segmentedControl floatingViewAtIndex:(NSInteger)index {
    if (index == 2) {
        NSArray *array = @[@"军-00", @"军-01", @"军-02"];
        if (segmentedControl.reuseFloatingView) {
            segmentedControl.reuseFloatingView.titles = array;
            segmentedControl.reuseFloatingView.alignment = LJFloatingViewAlignmentCenter;
            segmentedControl.reuseFloatingView.selectHandler = ^(NSIndexPath *indexPath) {
                [segmentedControl.itemButtons[index] setTitle:array[indexPath.row] forState:UIControlStateNormal];
                [segmentedControl.itemButtons[index] setTitle:array[indexPath.row] forState:UIControlStateSelected];
            };
            
            return segmentedControl.reuseFloatingView;
        } else {
            LJFloatingView *floatingView = [[LJFloatingView alloc] initWithFrame:CGRectMake(0, 0, 60, 200)];
            floatingView.titles = array;
            floatingView.alignment = LJFloatingViewAlignmentCenter;
            floatingView.selectHandler = ^(NSIndexPath *indexPath) {
                [segmentedControl.itemButtons[index] setTitle:array[indexPath.row] forState:UIControlStateNormal];
                [segmentedControl.itemButtons[index] setTitle:array[indexPath.row] forState:UIControlStateSelected];
            };
            return floatingView;
        }
    }
        else if (index == 1) {
             NSArray *array = @[@"敏-00", @"敏-01", @"敏-02"];
            if (segmentedControl.reuseFloatingView) {
                segmentedControl.reuseFloatingView.titles = array;
                segmentedControl.reuseFloatingView.selectHandler = ^(NSIndexPath *indexPath) {
                    [segmentedControl.itemButtons[index] setTitle:array[indexPath.row] forState:UIControlStateNormal];
                    [segmentedControl.itemButtons[index] setTitle:array[indexPath.row] forState:UIControlStateSelected];
                };
    
                return segmentedControl.reuseFloatingView;
            } else {
                LJFloatingView *floatingView = [[LJFloatingView alloc] initWithFrame:CGRectMake(0, 0, 60, 200)];
                floatingView.titles = array;
                floatingView.selectHandler = ^(NSIndexPath *indexPath) {
                    [segmentedControl.itemButtons[index] setTitle:array[indexPath.row] forState:UIControlStateNormal];
                    [segmentedControl.itemButtons[index] setTitle:array[indexPath.row] forState:UIControlStateSelected];
                };
                return floatingView;
            }
        }
    return nil;
}

@end
