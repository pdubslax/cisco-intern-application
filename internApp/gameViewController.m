//
//  gameViewController.m
//  internApp
//
//  Created by Patrick James Wilson on 6/26/13.
//  Copyright (c) 2013 Patrick James Wilson. All rights reserved.
//

#import "gameViewController.h"
#import "rulesViewController.h"

@interface gameViewController ()

@end

@implementation gameViewController
@synthesize image, button0, button3, button2, button1,names,pictures,wrongGirl,wrongGuy,male,nextbutton,f0,f1,f2,f3,fnext,imagePos,textbox,textPos,image2,scoreLabel,jobs,resultButton,progView,progLabel,answered;

int questions,correctq,correctTag;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)shuffle:(NSMutableArray*)ar1 same:(NSMutableArray*)ar2 lol:(NSMutableArray*)ar3 swag:(NSMutableArray*)ar4
{
    NSUInteger count = [ar2 count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [ar1 exchangeObjectAtIndex:i withObjectAtIndex:n];
        [ar2 exchangeObjectAtIndex:i withObjectAtIndex:n];
        [ar3 exchangeObjectAtIndex:i withObjectAtIndex:n];
        [ar4 exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

- (void)makeMyProgressBarMoving {
    
    float actual = [progView progress];
    if (actual > 0 && !answered) {
        progView.progress = actual - .006;
        float label = progView.progress * 1000;
        progLabel.text = [NSString stringWithFormat:@"%.0f",label];
        
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(makeMyProgressBarMoving) userInfo:nil repeats:NO];
    }
    else{
        
        
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    answered=false;
    progView.progress = 1.0;
    [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
    
    
    questions = 0;
    correctq = 0; // initialize score
    scoreLabel.hidden=TRUE;
    
    f0 = [button0 frame];
    f1 = [button1 frame];
    f2 = [button2 frame];
    f3 = [button3 frame];
    fnext = [nextbutton frame];
    imagePos = [image frame];
    textPos = [textbox frame];
    resultButton.enabled = NO;
    
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"gameInfo" ofType:@"plist"];
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    names = [dic objectForKey:@"names"];
    pictures = [dic objectForKey:@"pictures"];
    wrongGuy = [dic objectForKey:@"wrongGuys"];
    wrongGirl = [dic objectForKey:@"wrongGirls"];
    male = [dic objectForKey:@"male"];
    jobs = [dic objectForKey:@"jobs"];
    
    
    NSMutableArray *ar1=[names mutableCopy];
    NSMutableArray *ar2=[pictures mutableCopy];
    NSMutableArray *ar3=[jobs mutableCopy];
    NSMutableArray *ar4=[male mutableCopy];
    [self shuffle:ar1 same:ar2 lol:ar3 swag:ar4];
    
    names = [ar1 copy];
    pictures = [ar2 copy];
    jobs = [ar3 copy];
    male = [ar4 copy];
    
    [image setImage:[UIImage imageNamed:pictures[0]]];
    int lolz = arc4random()%4;
    correctTag=lolz;
    NSArray *hey = [NSArray arrayWithObjects:button0,button1,button2,button3, nil];
    
    resultButton.adjustsImageWhenDisabled = NO;

    for (UIButton *dummy in hey){
        if(dummy.tag == lolz){
            [dummy setTitle:names[0] forState:UIControlStateNormal];
        }
        dummy.adjustsImageWhenDisabled = NO;
    
    }
    
    NSNumber *val = male[0];
    BOOL thisisaguy = [val boolValue];
    
    if (thisisaguy) {
        [self setOther3Wrong:lolz wrongset:wrongGuy];
    }
    else{
        [self setOther3Wrong:lolz wrongset:wrongGirl];
    }
    
    //nextbutton.enabled=NO;
    nextbutton.hidden=YES;
    f0 = [button0 frame];
    f1 = [button1 frame];
    f2 = [button2 frame];
    f3 = [button3 frame];
    fnext = [nextbutton frame];
    
    
}

- (void)setOther3Wrong:(int)correct wrongset:(NSArray*)wrongans{
    NSArray *hey = [NSArray arrayWithObjects:button0,button1,button2,button3, nil];
    for (UIButton *dummy in hey){
        if(dummy.tag != correct){
            BOOL cont = TRUE;
            NSString *newwrong;
            while (cont) {
                cont = FALSE;
                newwrong = wrongans[arc4random() % [wrongans count]];
                 for (UIButton *hi in hey){
                     if ([[hi titleForState:UIControlStateNormal]isEqualToString:newwrong ]) {
                         cont = TRUE;
                     }
                 }
            }
            [dummy setTitle:newwrong forState:UIControlStateNormal];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightOrWrong {
    
    
    
    self.navigationItem.title=[NSString stringWithFormat:@"Round %d",questions+1];
    
    
    
    int lolz = arc4random()%4;
    correctTag=lolz;
    NSArray *hey = [NSArray arrayWithObjects:button0,button1,button2,button3, nil];
    
    for (UIButton *dummy in hey){
        if(dummy.tag == lolz){
            [dummy setTitle:names[questions] forState:UIControlStateNormal];
        }
        [dummy setBackgroundImage:[UIImage imageNamed:@"button (6).png"] forState:UIControlStateNormal];
    }
    NSNumber *val = male[questions];
    BOOL thisisaguy = [val boolValue];
    if (thisisaguy) {
        [self setOther3Wrong:lolz wrongset:wrongGuy];
    }
    else{
        [self setOther3Wrong:lolz wrongset:wrongGirl];
    }
    [self animateback];
    
    
    
    
}


- (IBAction)buttonPressed:(id)sender {
    NSArray *hey = [NSArray arrayWithObjects:button0,button1,button2,button3, nil];
    
    answered=true;
    progView.hidden=YES;
    progLabel.hidden=YES;
    
    
    
    
    
    questions++;
    
    
    
    
    // pressed button lights up (green)
    BOOL row= FALSE;
    if ([sender tag] == correctTag)
    {
        [resultButton setImage:[UIImage imageNamed:@"correct.png"] forState:UIControlStateNormal];
        correctq+=[progLabel.text intValue];
        row =TRUE;
    }
    else{
        [resultButton setImage:[UIImage imageNamed:@"wrong.png"] forState:UIControlStateNormal];
    }
    
    // for each loop that lights up (red) the remaining unpressed buttons
    
    UIButton *bingo;
    
    for (UIButton *but in hey)
    {
        if (but != hey[correctTag])
        {
            //[but setBackgroundImage:[UIImage imageNamed:@"wrong.png"] forState:UIControlStateNormal];
            
        }
        else{
            //[hey[correctTag] setBackgroundImage:[UIImage imageNamed:@"correct.png"]forState:UIControlStateNormal];
            bingo=but;
        }
        
        
    }
    nextbutton.hidden=NO;
    [self animate:bingo];
}

- (void)animate:(UIButton *)correct{
    
    CGRect framex = CGRectMake(-5, -5, 5, 5);
    CGRect framey = CGRectMake(-5, -5, 5, 5);
    CGRect framez = CGRectMake(-5, -5, 5, 5);
    CGRect resultFrame = CGRectMake(10, 220, 300, 90);
   
    

    CGRect framenext = CGRectMake(5, 335, 310, 60);
    CGRect corFrame = CGRectMake(0, 0, 160, 40);
    CGRect imageFocusFrame = CGRectMake(160, 0, 160, 160);
    
    //correct.enabled=FALSE;
    //[correct setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [textbox setText:jobs[questions-1]];
    correct.enabled=NO;
    
    
    [UIView transitionWithView:button0
                      duration:.5f
                       options:UIViewAnimationOptionCurveEaseInOut
                    animations:^(void) {
                        NSArray *hey = [NSArray arrayWithObjects:button0,button1,button2,button3, nil];
                        [correct setFrame:corFrame];
                        [resultButton setFrame:resultFrame];
                        int count =0;
                        for (UIButton *dummy in hey){
                            if (dummy!=correct) {
                                if (count==0){
                                    [dummy setFrame:framex];
                                    
                                    count++;
                                }
                                else if (count==1){
                                    [dummy setFrame:framey];
                                    count++;
                                }
                                else{
                                    [dummy setFrame:framez];
                                    count++;
                                }
                                [dummy setTitle:@"" forState:UIControlStateNormal];
                            }
                        }
                        
                        scoreLabel.hidden=NO;
                        
                        NSMutableString* aString = [NSMutableString stringWithFormat:@"Score: %d", correctq];
                        
                        
                        [scoreLabel setText:aString];
                        [scoreLabel setFrame:CGRectMake(160, 160, 160, 40)];
                        
                        [image setFrame:imageFocusFrame];

                        [nextbutton setFrame:framenext];
                        [textbox setFrame:CGRectMake(0, 40, 160, 160)];
                    }
     
                    completion:^(BOOL finished) {
                        
                         
                        
                    }];

   
}

- (void)animateback{
    
    
    
    [image2 setImage:[UIImage imageNamed:pictures[questions]]];

    
    [UIView transitionWithView:button0
                      duration:.5f
                       options:UIViewAnimationOptionCurveEaseInOut
                    animations:^(void) {
                        scoreLabel.hidden=YES;
                        [button0 setFrame:f0];
                        [button0 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                        [button1 setFrame:f1];
                        [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                        [button2 setFrame:f2];
                        [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                        [button3 setFrame:f3];
                        [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                        [nextbutton setFrame:fnext];
                        [image2 setFrame:imagePos];
                        [image setFrame:CGRectMake(-50, 0, 0, 0)];
                        [textbox setFrame:textPos];
                        [scoreLabel setFrame:CGRectMake(-50, 0, 50, 50)];
                        [resultButton setFrame:CGRectMake(10, 500, 300, 90)];
                        
                    }
                    completion:^(BOOL finished) {
                        nextbutton.hidden=YES;
                        UIImageView *tmp = image;
                        image = image2;
                        image2 = tmp;
                        [image2 setFrame:CGRectMake(320, 0, 0, 0)];
                        
                        
                                           }];
    
   
    
    
}


- (IBAction)nextButton:(id)sender {
    button0.enabled=YES;
    button1.enabled=YES;
    button2.enabled=YES;
    button3.enabled=YES;
    
    answered=false;
    progView.progress = 1.0;
    progLabel.hidden = NO;
    progView.hidden = NO;
    [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
    
    
    if((questions + 3) >= [names count]){
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        rulesViewController* vc = [sb instantiateViewControllerWithIdentifier:@"swag"];
        vc.navigationItem.hidesBackButton=YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else{
    [self rightOrWrong];
    }
    
    
    
}



   

    
    
    

- (IBAction)quit:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
