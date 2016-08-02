//
//  QuestionSearchViewController.m
//  stackReader
//
//  Created by David Livingstone on 8/1/16.
//  Copyright © 2016 David Livingstone. All rights reserved.
//

#import "QuestionSearchViewController.h"
#import "StackOverflowService.h"
#import "Question.h"

@interface QuestionSearchViewController ()

@end



@implementation QuestionSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;

}

- (void)viewDidAppear:(BOOL)animated {
    
    if (token) {
        [StackOverflowService questionsForSearchTerm:@"iOS" completionHandler:^(NSArray *results, NSError *error) {
            if (error) {
                NSLog(@"%@", error.localizedDescription);
                return;
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:questionCell
 forIndexPath:indexPath];
    
    Question *currentQuestion = self.searchedQuestions[indexPath.row];
    
    cell.textLabel.text = currentQuestion.title;
    
    return cell;
}

@end
