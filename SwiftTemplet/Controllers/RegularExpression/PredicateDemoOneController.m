////
////  PredicateDemoOneController.m
////  SwiftTemplet
////
////  Created by Bin Shang on 2021/9/15.
////  Copyright © 2021 BN. All rights reserved.
////
//
//#import "PredicateDemoOneController.h"
//#import "ProductModel.h"
//
//
//@interface PredicateDemoOneController ()
//
//@end
//
//@implementation PredicateDemoOneController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    
//    
//}
//
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//    [self test];
//}
//
//- (void)test{
//    //模拟数据
//    ProductModel *productA = [[ProductModel alloc] init];
//    productA.price = 99.0;
//    productA.name = @"iPod";
//        
//    ProductModel *productB = [[ProductModel alloc] init];
//    productB.price = 199.0;
//    productB.name = @"iMac";
//        
//    ProductModel *productC = [[ProductModel alloc] init];
//    productC.price = 299.0;
//    productC.name = @"iPhone";
//        
//    ProductModel *productD = [[ProductModel alloc] init];
//    productD.price = 199.0;
//    productD.name = @"iPhone";
//    
//    
//    NSArray *product = @[productA, productB, productC, productD];
//    NSNumber *count = [product valueForKeyPath:@"@count.price"];
//    NSNumber *avg = [product valueForKeyPath:@"@avg.price"];
//    NSNumber *max = [product valueForKeyPath:@"@max.price"];
//    NSNumber *min = [product valueForKeyPath:@"@min.price"];
//    NSNumber *sum = [product valueForKeyPath:@"@sum.price"];
//    NSLog(@"count:%@, avg:%@, max:%@, min:%@, sum:%@", count, avg, max, min, sum); // count:4, avg:199, max:299, min:99, sum:796
//    
//    
////    NSArray *array = @[@(productA.price), @(productB.price), @(productC.price), @(productD.price)];
////    NSNumber *count = [array valueForKeyPath:@"@count"];
////    NSNumber *avg = [array valueForKeyPath:@"@avg.self"];
////    NSNumber *max = [array valueForKeyPath:@"@max.self"];
////    NSNumber *min = [array valueForKeyPath:@"@min.self"];
////    NSNumber *sum = [array valueForKeyPath:@"@sum.self"];
////    NSLog(@"count:%@, avg:%@, max:%@, min:%@, sum:%@", count, avg, max, min, sum);//count:4, avg:199, max:299, min:99, sum:796
//    
//    NSArray *unionOfObjects = [product valueForKeyPath:@"@unionOfObjects.name"];
//    NSArray *distinctUnionOfObjects = [product valueForKeyPath:@"@distinctUnionOfObjects.name"];
//    NSLog(@"unionOfObjects : %@", unionOfObjects);//iPod,iMac,iPhone,iPhone
//    NSLog(@"distinctUnionOfObjects : %@", distinctUnionOfObjects);//iPhone,iPod,iMac
//    
//    
//    NSArray *distinctUnionOfArrays = [@[product, product] valueForKeyPath:@"@distinctUnionOfArrays.price"];
//    NSArray *unionOfArrays = [@[product, product] valueForKeyPath:@"@unionOfArrays.price"];
//    NSLog(@"distinctUnionOfArrays : %@", distinctUnionOfArrays);//299,99,199
//    NSLog(@"unionOfArrays : %@", unionOfArrays);//99,199,299,199,99,199,299,199
//    
//    
//    NSSet *setA = [NSSet setWithObjects:productA, productB, nil];
//    NSSet *setB = [NSSet setWithObjects:productC, productD, nil];
//    NSSet *set = [NSSet setWithObjects:setA, setB, nil];
//
//    NSSet *allSet = [set valueForKeyPath:@"@distinctUnionOfSets.name"];
//    NSLog(@"distinctUnionOfSets: %@", allSet);//iPhone,iPod,iMac
//    
//    
//    NSArray *arr = @[@"iPod", @"iPhone", @"iMac", @"iPhone8 Plus"];
//    NSArray *uppercaseStrArr = [arr valueForKeyPath:@"uppercaseString"];
//    NSLog(@"%@", uppercaseStrArr);// 输出: IPOD,IPHONE,IMAC,"IPHONE8 PLUS"
//    
//    
////    NSArray *priceArr = @[@99, @199, @299, @99];
////    NSNumber *count = [priceArr valueForKeyPath:@"@count"];
////    NSNumber *avg = [priceArr valueForKeyPath:@"@avg.self"];
////    NSNumber *max = [priceArr valueForKeyPath:@"@max.self"];
////    NSNumber *min = [priceArr valueForKeyPath:@"@min.self"];
////    NSNumber *sum = [priceArr valueForKeyPath:@"@sum.self"];
////    NSLog(@"count:%@, avg:%@, max:%@, min:%@, sum:%@", count, avg, max, min, sum);//count:4, avg:174, max:299, min:99, sum:696
////
////
////    NSNumber *count = [priceArr valueForKeyPath:@"@count"];
////    NSNumber *avg = [priceArr valueForKeyPath:@"@avg.floatValue"];
////    NSNumber *max = [priceArr valueForKeyPath:@"@max.floatValue"];
////    NSNumber *min = [priceArr valueForKeyPath:@"@min.floatValue"];
////    NSNumber *sum = [priceArr valueForKeyPath:@"@sum.floatValue"];
////    NSLog(@"count:%@, avg:%@, max:%@, min:%@, sum:%@", count, avg, max, min, sum);//count:4, avg:174, max:299, min:99, sum:696
//}
//
//
//@end
//
//
//
//
//
//
//@implementation ProductModel
//
//@end
