#import "ViewController.h"
#import "Requester.h"

@interface ViewController()<RequesterDelegate>

@end

@implementation ViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation = UIInterfaceOrientationPortrait);
}

#pragma mark - Requester Delegate
- (void)identifierDidFinishDownloading:(NSString *)identifier withJSON:(NSDictionary *)json
{
    if ([identifier isEqualToString:@"e"]) {
        //the GET has finished loading use NSDictionary method such as valueForKey to get the object you want
    }
    else if ([identifier isEqualToString:@"f"]) {
        //the POST has finished loading use NSDictionary method such as valueForKey to get the object you want
    }
    //etc.
    //if the identifier has nothing to do here that is fine.
    //It is also okay to not implement this method!
}

#pragma mark - Custom Instance Methods

- (IBAction)getPressed:(id)sender {
    Requester *req = [[Requester alloc] initWithRestString:@"/a" andDelegate:self andIdentifier:@"e"];
    [req performHTTPMethod:@"GET" withData:nil];
}

- (IBAction)postPressed:(id)sender {
    //this is an example of how to send data through POST.
    //an NSMutableArray can be serialized by NSJSONSerialization, so it is good.
    //you could also send other types through here, but I used an array for simplicity.
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:4];
    [array insertObject:[[NSNumber alloc] initWithInt:55] atIndex:0];
    [array insertObject:[[NSNumber alloc] initWithInt:99] atIndex:1];
    [array insertObject:[[NSNumber alloc] initWithInt:-5] atIndex:2];
    [array insertObject:[[NSNumber alloc] initWithInt:78] atIndex:3];
    
    Requester *req = [[Requester alloc] initWithRestString:@"/b" andDelegate:self andIdentifier:@"f"];
    //notice the with data is not nil this time, it is the array.
    [req performHTTPMethod:@"POST" withData:array];    
}

- (IBAction)putPressed:(id)sender {
    Requester *req = [[Requester alloc] initWithRestString:@"/c" andDelegate:self andIdentifier:@"g"];
    [req performHTTPMethod:@"PUT" withData:nil];
}

- (IBAction)deletePressed:(id)sender {
    Requester *req = [[Requester alloc] initWithRestString:@"/d" andDelegate:self andIdentifier:@"h"];
    [req performHTTPMethod:@"DELETE" withData:nil];
}

@end
