//
//  ContryDetailCell.m
//  iOSProject
//

#import "ContryDetailCell.h"
#import "CountryDetailModel.h"
#import "CommonFilesImport.h"


@implementation ContryDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
               reuseIdentifier :reuseIdentifier];
    
    if (self)
    {
        [self configureUI];
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

#pragma mark - UI Configuration -

- (void)updateConstraints
{
    [super updateConstraints];
    
    if (!self.didSetupConstraints)
    {
        
        [self.contryImageView
         autoPinEdgeToSuperviewEdge:ALEdgeLeft
         withInset:PTPX(10)];
        [self.contryImageView
         autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.contryImageView
         autoSetDimension:ALDimensionWidth
         toSize:PTPX(40)];
        [self.contryImageView
         autoSetDimension:ALDimensionHeight
         toSize:PTPX(40)];
        [self.contryImageView
         autoPinEdgeToSuperviewEdge:ALEdgeBottom
         withInset:5
         relation:NSLayoutRelationGreaterThanOrEqual];

        
        [self.lblTitle
         autoPinEdgeToSuperviewEdge:ALEdgeTop
         withInset:PTPX(5)];
        [self.lblTitle
         autoPinEdge:ALEdgeLeft
         toEdge:ALEdgeRight
         ofView:self.contryImageView
         withOffset:PTPX(10)];
        [self.lblTitle
         autoPinEdgeToSuperviewEdge:ALEdgeRight
         withInset:PTPX(10)];

        [self.lblTitle
         setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh
         forAxis:UILayoutConstraintAxisVertical];
        [self.lblTitle
         setContentHuggingPriority:UILayoutPriorityDefaultHigh
         forAxis:UILayoutConstraintAxisVertical];

        
        [self.lblDescription
         autoPinEdge:ALEdgeLeft
         toEdge:ALEdgeRight
         ofView:self.contryImageView
         withOffset:PTPX(10)];
        [self.lblDescription
         autoPinEdge:ALEdgeTop
         toEdge:ALEdgeBottom
         ofView:self.lblTitle
         withOffset:PTPX(10)];
        [self.lblDescription
         autoPinEdgeToSuperviewEdge:ALEdgeRight
         withInset:PTPX(10)];
        [self.lblDescription
         autoPinEdgeToSuperviewEdge:ALEdgeBottom
         withInset:PTPX(10)];
        
        
        [self.lblDescription
         setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh
         forAxis:UILayoutConstraintAxisVertical];
    }
}
- (void)configureUI
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self
     setBackgroundColor:[UIColor clearColor]];
    [self.contentView
     addSubview:self.lblTitle];
    [self.contentView
     addSubview:self.lblDescription];
    [self.contentView
     addSubview:self.contryImageView];

}

#pragma mark - UI Creation -

- (UIImageView *)contryImageView
{
    if (!_contryImageView)
    {
        _contryImageView = [UIUtils createImageView:@"country_placeholder"];
    }
    return _contryImageView;
}

- (UILabel *)lblTitle
{
    if (!_lblTitle)
    {
        _lblTitle = [UIUtils createLabelWithText:@""
                                    withTextColorHex:BLACK_HEX_000000
                                   withTextAlignment:NSTextAlignmentLeft
                                            withFont:HELVETICA_NEUE_BOLD
                                         andFontSize:PTPX(12)];
        _lblTitle.numberOfLines = 0;
    }
    return _lblTitle;
}

- (UILabel *)lblDescription
{
    if (!_lblDescription)
    {
        _lblDescription = [UIUtils createLabelWithText:@""
                                      withTextColorHex:BLACK_HEX_000000
                                     withTextAlignment:NSTextAlignmentLeft
                                              withFont:HELVETICA_NEUE
                                           andFontSize:PTPX(10)];
        _lblDescription.numberOfLines = 0;
    }
    return _lblDescription;
}

#pragma mark - Public Method -

- (void)setUpUIwithModel:(CountryDetailModel *)countryDetailModel
{
    self.lblTitle.text = countryDetailModel.title;
    self.lblDescription.text = countryDetailModel.countryDescription;
    
    if (countryDetailModel.imageHref)
    {
        [self.contryImageView
         sd_setImageWithURL:[NSURL URLWithString:countryDetailModel.imageHref]
         placeholderImage:[UIImage imageNamed:@"country_placeholder"]];
    }

}
- (void)resetUIandPrepareForReuse
{
    self.lblTitle.text = @"";
    self.lblDescription.text = @"";
    [self.contryImageView
     setImage:[UIImage imageNamed:@"country_placeholder"]];
}
@end
