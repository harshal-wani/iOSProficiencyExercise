//
//  ContryDetailCell.h
//  iOSProject
//

#import "AbstractCell.h"

@class CountryDetailModel;

@interface ContryDetailCell : AbstractCell

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UILabel *lblDescription;

@property (nonatomic, strong) UIImageView *contryImageView;

- (void)setUpUIwithModel:(CountryDetailModel *)countryDetailModel;

- (void)resetUIandPrepareForReuse;

@end