//
//  FlickrPhotosTableVC.h
//  FlickrFetchr
//
//  Created by Yamusa Dalhatu on 4/3/16.
//  Copyright © 2016 Elyamus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhotosTableVC : UITableViewController

// Model of this MVC (it can be publicly set)
@property (nonatomic, strong) NSArray *photos; // of Flickr photo NSDictionary

@end
