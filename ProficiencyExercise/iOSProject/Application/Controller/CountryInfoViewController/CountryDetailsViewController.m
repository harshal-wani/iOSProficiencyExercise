//
//  CountryDetailsViewController.m
//  iOSProject
//

#import "CountryDetailsViewController.h"
#import "CommonFilesImport.h"
#import "CountryDetailsProxy.h"
#import "CountryDetailModel.h"
#import "ContryDetailCell.h"
#import "CommonMethodHelper.h"
#import "UIScrollView+BottomRefreshControl.h"


@interface CountryDetailsViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tblCountryDetails;

@property(nonatomic, strong) UILabel *lblNoRecords;

@property(nonatomic, strong) NSMutableArray *countryDetailsArray;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation CountryDetailsViewController

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

        [self.tblCountryDetails
         autoPinEdgeToSuperviewEdge:ALEdgeTop
         withInset:NAV_BAR_HEIGHT];
        [self.tblCountryDetails
         autoPinEdgeToSuperviewEdge:ALEdgeLeft
         withInset:0];
        [self.tblCountryDetails
         autoPinEdgeToSuperviewEdge:ALEdgeRight
         withInset:0];
        [self.tblCountryDetails
         autoPinEdgeToSuperviewEdge:ALEdgeBottom
         withInset:0];
        
        self.didSetupConstraints = YES;
    }

 }
 #pragma mark – UI Configuration & Data initialization
//Data which is needed to initialize the UI
 - (void)initializeData {

 }

//Add other custom views in this method
 - (void)configureUI {

    [self.view addSubview:self.tblCountryDetails];
 }


 #pragma mark – UI Creation

- (UITableView *)tblCountryDetails
{
    if (!_tblCountryDetails)
    {
        _tblCountryDetails = [[UITableView alloc]initForAutoLayout];
        _tblCountryDetails.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [_tblCountryDetails registerClass:[ContryDetailCell class]
           forCellReuseIdentifier:@"ContryDetailCell"];
        _tblCountryDetails.backgroundColor = [UIColor clearColor];
        _tblCountryDetails.dataSource = self;
        _tblCountryDetails.delegate = self;
        _tblCountryDetails.allowsMultipleSelectionDuringEditing = NO;
        _tblCountryDetails.rowHeight = UITableViewAutomaticDimension;
        _tblCountryDetails.estimatedRowHeight = PTPX(54); // set to whatever your "average" cell height is
    }
    return _tblCountryDetails;
}
- (UILabel *)lblNoRecords
{
    if (!_lblNoRecords)
    {
        _lblNoRecords = [UIUtils createLabelWithText:NSLocalizedString(@"No country details found.", nil)
                                             withTextColorHex:BLACK_HEX_000000
                                            withTextAlignment:NSTextAlignmentCenter
                                                     withFont:HELVETICA_NEUE_BOLD
                                                  andFontSize:PTPX(10)];
        [_lblNoRecords setLineBreakMode:NSLineBreakByWordWrapping];
    }
    return _lblNoRecords;
}
-(UIRefreshControl *)refreshControl{
    
    if (!_refreshControl) {
        
        _refreshControl = [UIRefreshControl new];
        
        _refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull up to reload!"];
        _refreshControl.triggerVerticalOffset = 80;
        [_refreshControl addTarget:self action:@selector(refreshBottom) forControlEvents:UIControlEventValueChanged];
    }
    return _refreshControl;
}

 #pragma mark – View Life Cycle


 - (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
     self.automaticallyAdjustsScrollViewInsets=NO;
     self.tblCountryDetails.bottomRefreshControl = self.refreshControl;

     [self callGetCountryDetailsAPI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.view
     setBackgroundColor:[UIUtils colorFromHexColor:WHITE_HEX_FFFFFF]];

    [self.navigationController
     setNavigationBarHidden:NO animated:YES];
}

 #pragma mark – Event Handling

 - (void)navigationBarLeftButtonClicked
 {
    [self.navigationController popViewControllerAnimated:YES];

 }

 #pragma mark – Private Methods
- (void)refreshBottom {
    
    double delayInSeconds = 0.4;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        //Update offset and call API to load more records
        
        //TODO: Add line into the success/failure of calling API
        [self.tblCountryDetails.bottomRefreshControl endRefreshing];

    });
}



 #pragma mark - Public Methods

#pragma mark Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.countryDetailsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ContryDetailCell";
    
    ContryDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                            forIndexPath:indexPath];
    
    [cell resetUIandPrepareForReuse];
    [cell setUpUIwithModel:self.countryDetailsArray[indexPath.row]];
    
    return cell;
}

 #pragma mark – Delegate Methods
 #pragma mark – API Call and Delegate Methods

-(void)callGetCountryDetailsAPI{
    

    [CommonMethodHelper checkNetworkAndShowHudForView:self.view];
    
    [[CountryDetailsProxy new] getCountryDetailsWithSuccess:^(NSDictionary *responseDict) {
        
        self.countryDetailsArray = responseDict[@"rows"];
        self.navigationController.topViewController.title = responseDict[@"title"];
        [self.tblCountryDetails reloadData];
        
        [CommonMethodHelper hideHudForView:self.view];
        
    } withFailure:^(NSDictionary *responseDict) {
        
        
    }];
}
@end
