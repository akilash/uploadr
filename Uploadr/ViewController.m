//
//  ViewController.m
//  Uploadr
//
//  Created by Akil Ash on 12/12/14.
//
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    NSMutableArray * assets = [[NSMutableArray alloc]init];
    PHFetchResult * moments = [PHAssetCollection fetchMomentsWithOptions:nil];
    
    NSUInteger momentsCount = moments.count;
    
    for (PHAssetCollection * moment in moments) {
        
        PHFetchResult * assetsFetchResults = [PHAsset fetchAssetsInAssetCollection:moment options:nil];
        
        __block NSUInteger pendingEnumerations = assetsFetchResults.count;// * momentsCount;

        for (PHAsset * asset in assetsFetchResults) {
            
            [[PHImageManager defaultManager] requestImageDataForAsset:asset options:nil resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
                
                [assets addObject:imageData];
                
                NSUInteger imageSize = imageData.length;
                
                NSLog(@"%lu",(unsigned long)imageSize);
                
                pendingEnumerations--;
                
                if (pendingEnumerations <= 0) {
                    
                    NSArray * sortedAssets =  [self quickSort:assets];
                    
                    NSLog(@"sortedAssets: %@",sortedAssets);
                }
                
            }];
            
        }
        
        
        
    }
    
}

-(NSArray *)quickSort:(NSMutableArray *)unsortedDataArray
{
    
    NSMutableArray *lessArray = [NSMutableArray new] ;
    NSMutableArray *greaterArray =[NSMutableArray new] ;
    if ([unsortedDataArray count] <1)
    {
        return nil;
    }
    int randomPivotPoint = arc4random() % [unsortedDataArray count];
    NSData *pivotValue = [unsortedDataArray objectAtIndex:randomPivotPoint];
    [unsortedDataArray removeObjectAtIndex:randomPivotPoint];
    for (NSData *imageData in unsortedDataArray)
    {
       
        if (imageData.length < pivotValue.length)
        {
            [lessArray addObject:imageData];
        }
        else
        {
            [greaterArray addObject:imageData];
        }
    }
    NSMutableArray *sortedArray = [NSMutableArray new];
    [sortedArray addObjectsFromArray:[self quickSort:lessArray]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[self quickSort:greaterArray]];
    return sortedArray;
}

@end
