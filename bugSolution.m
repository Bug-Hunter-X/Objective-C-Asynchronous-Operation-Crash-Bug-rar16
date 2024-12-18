//Solution using blocks
@implementation MyClass
- (void)myMethod {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self) { // Check if the object is still alive
            [self performSomeTask];
        }
    });
}

- (void)performSomeTask {
    NSLog (@"Task performed");
}
@end

//Solution using weak reference in a block
@implementation MyClass
- (void)myMethod {
    __weak typeof(self) weakSelf = self;  //Create a weak reference to self
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        typeof(self) strongSelf = weakSelf; 
        if (strongSelf) {
            [strongSelf performSomeTask];
        }
    });
}

- (void)performSomeTask {
    NSLog (@"Task performed");
}
@end