//
//  AbstractViewController.h
//  iOSProject
//

#import <UIKit/UIKit.h>

@interface AbstractViewController : UIViewController

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

//
// -(void)loadView {
//
//
//    self.view = [UIView new];
//
//    [self initializeData];
//
//    [self configureUI];
//
//    [self.view setNeedsUpdateConstraints];
// }
//
//
// -(void)updateViewConstraints {
//
//    [super updateViewConstraints];
//
//    //All the constraints in the ViewController should be written only in this method
//    if (!self.didSetupConstraints) {
//
//
//        self.didSetupConstraints = YES;
//    }
//
//
// }
// #pragma mark – UI Configuration & Data initialization
////Data which is needed to initialize the UI
// - (void)initializeData {
//
// }
//
////Add other custom views like LLabelRLabel in this method
// - (void)configureUI {
//
//
//    //Add Custom Views here
//    //Add other views in here eg. [self.view addSubview:self.scrollview];
//
//
// }
//
//
// #pragma mark – UI Creation
//
//
// #pragma mark – View Life Cycle
//
//
// - (void)viewDidLoad {
//    [super viewDidLoad];

//    // Do any additional setup after loading the view.
// }
//
// #pragma mark – Event Handling
//
//
// - (void)navigationBarLeftButtonClicked
// {
//    [self.navigationController popViewControllerAnimated:YES];
//
// }
//
//
// #pragma mark – Private Methods
//
//
//
// #pragma mark - Public Methods
// #pragma mark – Delegate Methods
// #pragma mark – API Call and Delegate Methods
