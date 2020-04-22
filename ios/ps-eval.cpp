//
//  ps-eval.cpp
//  RNPokerStoveLib
//
//  Created by Sameer Jain on 18/04/20.
//  Copyright © 2020 Saachi. All rights reserved.
//

//This class is small modification of the programs/pseval/main.cpp.
//It will return the data grabed from the eveluation

#include <boost/program_options.hpp>
#include <iostream>
#include <pokerstove/penum/ShowdownEnumerator.h>
#include <vector>

using namespace pokerstove;
using namespace std;

vector<string> calculateEquity(const std::string& game,
               const std::string& board,
               const std::string& playerHand,
               const std::string& opponentHand
               )
{
    
    // extract the options
    //string game = "O";
   // string board = "";
    //vector<string> hands = vm["hand"].as<vector<string>>();
    vector<string> hands;
    hands.push_back(playerHand);
    hands.push_back(opponentHand);

    bool quiet = 1;

    // allocate evaluator and create card distributions
    boost::shared_ptr<PokerHandEvaluator> evaluator =
        PokerHandEvaluator::alloc(game);
    vector<CardDistribution> handDists;
    for (const string& hand : hands)
    {
        handDists.emplace_back();
        handDists.back().parse(hand);
    }

    // fill with random if necessary
    if (handDists.size() == 1)
    {
        handDists.emplace_back();
        handDists.back().fill(evaluator->handSize());
    }

    // calcuate the results and print them
    ShowdownEnumerator showdown;
    vector<EquityResult> results =
        showdown.calculateEquity(handDists, CardSet(board), evaluator);


    double total = 0.0;
    for (const EquityResult& result : results)
    {
        total += result.winShares + result.tieShares;
    }
    vector<string> equities;
    for (size_t i = 0; i < results.size(); ++i)
    {
        double equity = (results[i].winShares + results[i].tieShares) / total;
        //string handDesc = (i < hands.size()) ? "The hand " + hands[i] : "A random hand";
        equities.push_back(to_string(equity * 100));
        //cout << handDesc << " has " << equity * 100. << " % equity (" << results[i].str() << ")" << endl;
    }
    return equities;
}
