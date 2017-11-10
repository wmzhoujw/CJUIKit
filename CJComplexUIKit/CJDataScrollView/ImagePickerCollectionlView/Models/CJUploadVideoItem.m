//
//  CJUploadVideoItem.m
//  CommonAFNUtilDemo
//
//  Created by ciyouzen on 2017/2/23.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CJUploadVideoItem.h"
#import <CJMedia/CJAlumbImageUtil.h>

@implementation CJUploadVideoItem

/** 完整的描述请参见文件头部 */
- (instancetype)initWithShowImage:(UIImage *)showImage
           imageLocalRelativePath:(NSString *)imageLocalRelativePath
           videoLocalRelativePath:(NSString *)videoLocalRelativePath
                 uploadFileModels:(NSArray<CJUploadFileModel *> *)uploadFileModels
{
    self = [super init];
    if (self) {
        self.image = [self adjustImageWithImage:showImage];
        
        self.imageLocalRelativePath = imageLocalRelativePath;
        self.videoLocalRelativePath = videoLocalRelativePath;
        self.uploadFileModels = [NSMutableArray arrayWithArray:uploadFileModels];
    }
    
    return self;
}

- (UIImage *)adjustImageWithImage:(UIImage *)image
{
    NSData * imageData = UIImageJPEGRepresentation(image,1);
    NSLog(@"origin --imageData : %f MB size:%@",(unsigned long)[imageData length]/(1024*1024.f),[NSValue valueWithCGSize:image.size]);
    
    if ([imageData length] > 0.5 * 1024 * 1024) {
        imageData = UIImageJPEGRepresentation(image, 0.8);
        if ([imageData length] > 0.5 * 1024 * 1024) {
            UIImage *tempImage = [UIImage imageWithData:imageData];
            image = [CJAlumbImageUtil cj_transformImage:tempImage toMinificationSize:CGSizeMake(1920, 1920)];
        }
        
        imageData = UIImageJPEGRepresentation(image,0.8);
        NSLog(@"result has scaled -- imageData : %f MB size:%@",(unsigned long)imageData.length/(1024*1024.f),[NSValue valueWithCGSize:image.size]);
        
        image = [UIImage imageWithData:imageData];
        return image;
    }
    else
    {
        return image;
    }
}


@end
