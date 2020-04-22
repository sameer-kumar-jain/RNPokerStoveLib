//
//  ps-eval.h
//  RNPokerStoveLib
//
//  Created by Sameer Jain on 18/04/20.
//  Copyright © 2020 Saachi. All rights reserved.
//

#ifdef __cplusplus
extern "C" {
#endif



#ifdef __cplusplus
}
#endif

#include <string>
#include <vector>

std::vector<std::string> calculateEquity(const std::string& game,
const std::string& board,
const std::string& playerHand,
const std::string& opponentHand);

