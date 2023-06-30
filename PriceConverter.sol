// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//this will get us a mimumalistic ABI so we can interact with this chainlink contract
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


//libraries cannot have state variables
//all funcs have to be internal
library PriceConverter{
   function getPrice() internal view returns(uint256){
        //Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        //ABI 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        //This function returns multiple variables but we donnt care about them, only about the price
        //this price variable is representing the price of ETH in terms of USD
        //and returns a number with 8 decimals but without a decimal sign
        (, int256 price,,,) = priceFeed.latestRoundData();
        //msg.value has 18 decimal places, price has 8. Multiply to match up
        //typecasting is necessary since price is int, msg.value is uint
        return uint256(price * 1e10); 
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        //division is needed as 1e18 * 1e18 = 1e36
        //In Solidity it is very important to multiply before dividing, since Solidity having 0 decimals would give 1 / 2 = 0
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}