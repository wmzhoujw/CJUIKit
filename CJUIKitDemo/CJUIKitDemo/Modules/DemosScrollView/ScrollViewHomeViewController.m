//
//  ScrollViewHomeViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "ScrollViewHomeViewController.h"

//UIScrollView
#import "SvDemo_Refresh.h"
#import "ScrollViewController.h"

//EmptyView
#import "BBXPassengerEmptyViewController.h"

//UITableView
#import "TableViewController.h"
#import "DemoTableViewController.h"
#import "ReuseDataSourceTableViewController.h"
#import "TvDemo_Complex.h"
#import "OpenTableViewController1.h"
#import "OpenTableViewController2.h"
#import "ChooseColor01.h"

//UICollectionView
#import "CvDemo_Complex.h"

#import "MyEqualCellSizeCollectionViewController.h"
#import "MyEqualCellSizeViewController.h"
#import "MyCycleADViewController.h"

#import "OpenCollectionViewController.h"
#import "CustomLayoutCollectionViewController.h"

@interface ScrollViewHomeViewController () <UITableViewDataSource, UITableViewDelegate> {
    
}

@end

@implementation ScrollViewHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"ScrollViewHome首页", nil); //知识点:使得tabBar中的title可以和显示在顶部的title保持各自
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView = tableView;
    
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    //UIScrollView
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"UIScrollView相关";
        {
            CJModuleModel *baseScrollViewModule = [[CJModuleModel alloc] init];
            baseScrollViewModule.title = @"ScrollView的最基本约束";
            baseScrollViewModule.classEntry = [UIViewController class];
            [sectionDataModel.values addObject:baseScrollViewModule];
        }
        {
            CJModuleModel *refreshScrollViewModule = [[CJModuleModel alloc] init];
            refreshScrollViewModule.title = @"ScrollView的刷新(MJRefresh)";
            refreshScrollViewModule.classEntry = [SvDemo_Refresh class];
            [sectionDataModel.values addObject:refreshScrollViewModule];
        }
        {
            CJModuleModel *cjScrollViewModuleModel = [[CJModuleModel alloc] init];
            cjScrollViewModuleModel.title = @"ScrollView(纯代码创建)";
            cjScrollViewModuleModel.classEntry = [ScrollViewController class];
            [sectionDataModel.values addObject:cjScrollViewModuleModel];
        }
        
        [sectionDataModels addObject:sectionDataModel];
    }
    
    //EmptyView
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"EmptyView相关";
        {
            CJModuleModel *baseScrollViewModule = [[CJModuleModel alloc] init];
            baseScrollViewModule.title = @"CJDataEmptyView";
            baseScrollViewModule.classEntry = [BBXPassengerEmptyViewController class];
            [sectionDataModel.values addObject:baseScrollViewModule];
        }
        
        [sectionDataModels addObject:sectionDataModel];
    }
    
    //UITableView
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"UITableView相关";
        {
            CJModuleModel *TableViewModule = [[CJModuleModel alloc] init];
            TableViewModule.title = @"TableView(最原始的使用)";
            TableViewModule.classEntry = [TableViewController class];
            [sectionDataModel.values addObject:TableViewModule];
        }
        {
            CJModuleModel *baseDemoModule = [[CJModuleModel alloc] init];
            baseDemoModule.title = @"BaseDemo";
            baseDemoModule.classEntry = [DemoTableViewController class];
            [sectionDataModel.values addObject:baseDemoModule];
        }
        {
            CJModuleModel *reuseDataSourceTableModule = [[CJModuleModel alloc] init];
            reuseDataSourceTableModule.title = @"ReuseDataSourceTable";
            reuseDataSourceTableModule.classEntry = [ReuseDataSourceTableViewController class];
            [sectionDataModel.values addObject:reuseDataSourceTableModule];
        }
        {
            CJModuleModel *complexDemoModule = [[CJModuleModel alloc] init];
            complexDemoModule.title = @"ComplexDemo";
            complexDemoModule.classEntry = [TvDemo_Complex class];
            [sectionDataModel.values addObject:complexDemoModule];
        }
        {
            CJModuleModel *openTableModule = [[CJModuleModel alloc] init];
            openTableModule.title = @"OpenTable(不使用控件)";
            openTableModule.classEntry = [OpenTableViewController1 class];
            [sectionDataModel.values addObject:openTableModule];
        }
        {
            CJModuleModel *openTableModule = [[CJModuleModel alloc] init];
            openTableModule.title = @"OpenTable(使用控件)";
            openTableModule.classEntry = [OpenTableViewController2 class];
            [sectionDataModel.values addObject:openTableModule];
        }
        {
            CJModuleModel *chooseColorModule = [[CJModuleModel alloc] init];
            chooseColorModule.title = @"ChooseColor01";
            chooseColorModule.classEntry = [ChooseColor01 class];
            [sectionDataModel.values addObject:chooseColorModule];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    
    //UICollectionView
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"UICollectionView相关";
        {
            CJModuleModel *complexDemoModule = [[CJModuleModel alloc] init];
            complexDemoModule.title = @"ComplexDemo";
            complexDemoModule.classEntry = [CvDemo_Complex class];
            [sectionDataModel.values addObject:complexDemoModule];
        }
        {
            CJModuleModel *MyEqualCellSizeCollectionViewModule = [[CJModuleModel alloc] init];
            MyEqualCellSizeCollectionViewModule.title = @"MyEqualCellSizeCollectionView(等cell大小)";
            MyEqualCellSizeCollectionViewModule.classEntry = [MyEqualCellSizeCollectionViewController class];
            [sectionDataModel.values addObject:MyEqualCellSizeCollectionViewModule];
        }
        {
            CJModuleModel *MyEqualCellSizeViewModule = [[CJModuleModel alloc] init];
            MyEqualCellSizeViewModule.title = @"MyEqualCellSizeView(嵌套的等cell大小)";
            MyEqualCellSizeViewModule.classEntry = [MyEqualCellSizeViewController class];
            [sectionDataModel.values addObject:MyEqualCellSizeViewModule];
        }
        {
            CJModuleModel *cycleScrollViewModule = [[CJModuleModel alloc] init];
            cycleScrollViewModule.title = @"MyCycleADView(无限循环的视图)";
            cycleScrollViewModule.classEntry = [MyCycleADViewController class];
            [sectionDataModel.values addObject:cycleScrollViewModule];
        }
        {
            CJModuleModel *openCollectionViewModule = [[CJModuleModel alloc] init];
            openCollectionViewModule.title = @"OpenCollectionView(可展开)";
            openCollectionViewModule.classEntry = [OpenCollectionViewController class];
            [sectionDataModel.values addObject:openCollectionViewModule];
        }
        {
            CJModuleModel *customLayoutModule = [[CJModuleModel alloc] init];
            customLayoutModule.title = @"CustomLayout(自定义布局)";
            customLayoutModule.classEntry = [CustomLayoutCollectionViewController class];
            [sectionDataModel.values addObject:customLayoutModule];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    self.sectionDataModels = sectionDataModels;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionDataModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CJSectionDataModel *sectionDataModel = [self.sectionDataModels objectAtIndex:section];
    NSArray *dataModels = sectionDataModel.values;
    
    return dataModels.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CJSectionDataModel *sectionDataModel = [self.sectionDataModels objectAtIndex:section];
    
    NSString *indexTitle = sectionDataModel.theme;
    return indexTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CJSectionDataModel *sectionDataModel = [self.sectionDataModels objectAtIndex:indexPath.section];
    NSArray *dataModels = sectionDataModel.values;
    CJModuleModel *moduleModel = [dataModels objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = moduleModel.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"didSelectRowAtIndexPath = %ld %ld", indexPath.section, indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CJSectionDataModel *sectionDataModel = [self.sectionDataModels objectAtIndex:indexPath.section];
    NSArray *dataModels = sectionDataModel.values;
    CJModuleModel *moduleModel = [dataModels objectAtIndex:indexPath.row];
    
    
    Class classEntry = moduleModel.classEntry;
    NSString *nibName = NSStringFromClass(moduleModel.classEntry);
    
    
    UIViewController *viewController = nil;
    
    NSArray *noxibViewControllers = @[NSStringFromClass([UIViewController class]),
                                      ];
    
    NSString *clsString = NSStringFromClass(moduleModel.classEntry);
    if ([noxibViewControllers containsObject:clsString])
    {
        viewController = [[classEntry alloc] init];
        viewController.view.backgroundColor = [UIColor whiteColor];
        
    } else if ([clsString isEqualToString:NSStringFromClass([ChooseColor01 class])]) {
        viewController = [[ChooseColor01 alloc] initWithStyle:UITableViewStyleGrouped];
        
    } else {
        viewController = [[classEntry alloc] initWithNibName:nibName bundle:nil];
    }
    viewController.title = NSLocalizedString(moduleModel.title, nil);
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
