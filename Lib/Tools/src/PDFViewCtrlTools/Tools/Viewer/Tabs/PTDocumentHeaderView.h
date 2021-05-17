//---------------------------------------------------------------------------------------
// Copyright (c) 2001-2020 by PDFTron Systems Inc. All Rights Reserved.
// Consult legal.txt regarding legal and license information.
//---------------------------------------------------------------------------------------

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTDocumentHeaderView : UIView

@property (nonatomic, nullable) UIView *contentView;

- (void)transitionToView:(nullable UIView *)toView animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END