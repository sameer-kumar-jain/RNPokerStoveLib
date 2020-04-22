
//
//  RNPokerStoveLib.mm
//  RNPokerStoveLib
//
//  Created by Sameer Jain on 18/04/20.
//  Copyright © 2020 Saachi. All rights reserved.
//

#import "RNPokerStoveLib.h"
#import "ps-eval.h"
#import <pokerstove/peval/PokerEvaluation.h>
#import <pokerstove/peval/CardSet.h>

#import <pokerstove/peval/OmahaHighHandEvaluator.h>

using namespace pokerstove;
using namespace std;

@implementation RNPokerStoveLib

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(calculateEquity:(NSString *)game
                  board:(NSString *)board
                  cardBoard:(NSString *)playerCard
                  cardBoard:(NSString *)opponentCard
                  callback:(RCTResponseSenderBlock)callback
                  )
{
    /*
    We ned to convert parameters so our c++ code can understand it
    */
    std::string cGame = std::string([game cStringUsingEncoding:NSASCIIStringEncoding]);
    std::string cBoard = std::string([board cStringUsingEncoding:NSASCIIStringEncoding]);
    std::string cPlayerCard = std::string([playerCard cStringUsingEncoding:NSASCIIStringEncoding]);
    std::string cOpponentCard = std::string([opponentCard cStringUsingEncoding:NSASCIIStringEncoding]);
    //Since the code takes longer so we que it to background process. This is useful so the application doesnt look hanged. This block will execute our final code and callback with resulted data
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //Here we call c++ code to get equity 
        std::vector<std::string> cEquities = getPSEVAL(cGame,cBoard, cPlayerCard, cOpponentCard);
        //convert c++ array back to objective c
        NSMutableArray *equities = [NSMutableArray arrayWithCapacity: 2];
        for(auto const& pt: cEquities){
            [equities addObject:[NSString stringWithCString:pt.c_str() encoding:NSUTF8StringEncoding]];
        }
        //NSString *first =equities[0];
        //NSString *second =equities[1];
        
        //NSLog(@"%@, %@, %@, %@, %@, %@", game, board, playerCard, opponentCard, first, second);
        //callback react code
        callback(@[[NSNull null], equities]);
    });
}

@end
