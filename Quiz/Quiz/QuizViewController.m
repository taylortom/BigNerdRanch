//
//  QuizViewController.m
//  Quiz
//
//  Created by Thomas Taylor on 03/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        questions = [[NSMutableArray alloc] init];
        answers = [[NSMutableArray alloc] init];
        
        [questions addObject:@"What is 7 + 7?"];
        [answers addObject:@"14"];
        
        [questions addObject:@"What is the capital of Vermont?"];
        [answers addObject:@"Montpelier"];
        
        [questions addObject:@"From what is cognac made?"];
        [answers addObject:@"Grapes"];
    }
    
    return self;
}

-(IBAction)showQuestion:(id)sender
{
    currentQuestionIndex++;
    
    if(currentQuestionIndex == [questions count]) currentQuestionIndex = 0;
    
    NSString* question = [questions objectAtIndex:currentQuestionIndex];
    
    NSLog(@"Showing question: %@", question);
    
    [questionField setText:question];
    
    [answerField setText:@"???"];
}

-(IBAction)showAnswer:(id)sender
{
    NSString* answer = [answers objectAtIndex:currentQuestionIndex];
    [answerField setText:answer];
}

@end
