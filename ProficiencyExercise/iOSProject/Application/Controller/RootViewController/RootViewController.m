//
//  RootViewController.m
//  iOSProject
//

#import "RootViewController.h"
#import "CommonFilesImport.h"
#import "CountryDetailsViewController.h"


@interface RootViewController ()

@property (nonatomic, strong) UIButton *btnCountryDetails;

@end

@implementation RootViewController

#pragma mark – Load View and constraints

 -(void)loadView {


    self.view = [UIView new];

    [self initializeData];

    [self configureUI];

    [self.view setNeedsUpdateConstraints];
 }


 -(void)updateViewConstraints {

    [super updateViewConstraints];

    //All the constraints in the ViewController should be written only in this method
    if (!self.didSetupConstraints) {
        
        [self.btnCountryDetails autoCenterInSuperview];
        [self.btnCountryDetails
         autoSetDimensionsToSize:CGSizeMake(PTPX(120), PTPX(25))];

        self.didSetupConstraints = YES;
    }
 }
 #pragma mark – UI Configuration & Data initialization

//Data which is needed to initialize the UI
 - (void)initializeData {

 }

 - (void)configureUI {


    //Add Custom Views here
    [self.view addSubview:self.btnCountryDetails];


 }

 #pragma mark – UI Creation

- (UIButton *)btnCountryDetails
{
    if (!_btnCountryDetails)
    {
        _btnCountryDetails = [UIUtils createButtonWithBGImageName:nil
                                  andHighlightedImageName:@""
                                           andEventTarget:self
                                                andAction:@selector(countryDetailsButtonTapped)
                                                   andTag:1
                                           andButtonTitle:NSLocalizedString(@"Country Details", nil)
                                              andFontSize:PTPX(16)
                                              andFontType:HELVETICA_NEW_BOLD
                                          andFontColorHex:BLACK_HEX_000000
                                          andLeftCapWidth:0
                                         andLeftCapHeight:0];
    }
    return _btnCountryDetails;
}


 #pragma mark – View Life Cycle


 - (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
 }
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationController
         setNavigationBarHidden:YES animated:YES];
}
 #pragma mark – Event Handling

 - (void)countryDetailsButtonTapped
 {
//     [UIUtils alertView:@"asd" withTitle:@"eret"];
     CountryDetailsViewController *countryDetailsViewController = [[CountryDetailsViewController alloc] init];

     [self.navigationController pushViewController:countryDetailsViewController animated:YES];
     
 }


 #pragma mark – Private Methods


 #pragma mark - Public Methods
 #pragma mark – Delegate Methods
 #pragma mark – API Call and Delegate Methods

@end
