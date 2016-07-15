//
//  AbstractCell.m
//  iOSProject
//

#import "AbstractCell.h"

@implementation AbstractCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
               reuseIdentifier :reuseIdentifier];
    
    if (self)
    {
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
    }
}

- (void)configureUI
{
    [self
     setBackgroundColor:[UIColor clearColor]];
}


#pragma mark - UI Creation -

#pragma mark - Event Handling -

#pragma mark - Public Method -

@end
