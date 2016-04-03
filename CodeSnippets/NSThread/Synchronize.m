@interface AppDelegate : UIResponder <UIApplicationDelegate>   
{   
    int tickets;   
    int count;   
    NSThread* ticketsThreadone;   
    NSThread* ticketsThreadtwo;   
    NSCondition* ticketsCondition;   
    NSLock *theLock;   
}   
@property (strong, nonatomic) UIWindow *window;   
 
@property (strong, nonatomic) ViewController *viewController;   
 
@end

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions   
{   
 
    tickets = 100;   
    count = 0;   
    theLock = [[NSLock alloc] init];   
    ticketsCondition = [[NSCondition alloc] init];   
    ticketsThreadone = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];   
    [ticketsThreadone setName:@"Thread-1"];   
    [ticketsThreadone start];   
 
    ticketsThreadtwo = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];   
    [ticketsThreadtwo setName:@"Thread-2"];   
    [ticketsThreadtwo start];   
 
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];   

    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];   
    self.window.rootViewController = self.viewController;   
    [self.window makeKeyAndVisible];   
    return YES;   
}   
 
- (void)run{   
    while (TRUE) {   
//        [ticketsCondition lock];   
        [theLock lock];   
        if(tickets >= 0){   
            [NSThread sleepForTimeInterval:0.09];   
            count = 100 - tickets;   
            NSLog(@"currentTicketNum:%d,SoldNum:%d,ThreadName:%@",tickets,count,[[NSThread currentThread] name]);   
            --tickets;   
        }else{   
            break;   
        }   
        [theLock unlock];   
//        [ticketsCondition unlock];   
    }   
}
