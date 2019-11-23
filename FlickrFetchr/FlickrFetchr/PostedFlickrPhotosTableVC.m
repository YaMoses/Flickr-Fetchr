//
//  PostedFlickrPhotosTableVC.m
//  FlickrFetchr
//
//  Created by Yamusa Dalhatu on 4/3/16.
//  Copyright © 2016 Elyamus. All rights reserved.
//

#import "PostedFlickrPhotosTableVC.h"
#import "FlickrFetcher.h"

@implementation PostedFlickrPhotosTableVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchPhotos];
}


- (IBAction)fetchPhotos
{
    [self.refreshControl beginRefreshing]; // starting spinner
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    // creating a (non-main) queue to do fetch on
    dispatch_queue_t fetchQ = dispatch_queue_create("flickr fetcher", NULL);
    dispatch_async(fetchQ, ^{
        // fetch the JSON data from Flickr
        NSData *jsonResults = [NSData dataWithContentsOfURL:url];
        // convert it to a Property List (NSArray and NSDictionary)
        NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults
                                                                            options:0
                                                                              error:NULL];
        
        NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing]; // stop spinner
            self.photos = photos;
        });
    });
}

@end
