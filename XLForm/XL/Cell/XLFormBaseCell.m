//
//  XLFormBaseCell.m
//  XLForm ( https://github.com/xmartlabs/XLForm )
//
//  Copyright (c) 2014 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "XLFormBaseCell.h"

@implementation XLFormBaseCell

- (id)init
{
    return [self initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configure];
    }
    return self;
}


-(void)setRowDescriptor:(XLFormRowDescriptor *)rowDescriptor
{
    _rowDescriptor = rowDescriptor;
    [self update];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    if (self.imageViewLeftMargin) {
        CGRect frame = self.imageView.frame;
        frame.origin.x = self.imageViewLeftMargin.floatValue;
        if (self.imageViewLayoutHeight) {
            
            CGFloat imageViewLayoutHeight = self.imageViewLayoutHeight.floatValue;
            frame.size.height = imageViewLayoutHeight - (CGRectGetMinY(frame) * 2.0);
        }
        self.imageView.frame = frame;
    }
    
    if (self.textLabelLeftMargin) {
        CGRect frame = self.textLabel.frame;
        frame.origin.x = self.textLabelLeftMargin.floatValue;
        self.textLabel.frame = frame;
    }
}

- (void)configure
{
    //override
}

- (void)update
{
    // override
}

-(XLFormViewController *)formViewController
{
    id responder = self;
    while (responder){
        if ([responder isKindOfClass:[UIViewController class]]){
            return responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}


@end
