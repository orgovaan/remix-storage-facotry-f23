// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;


contract FallbackExmaple{
    uint256 public result;


//ial function RECEIVE gets triggered only if calldata of the transacion is empty
//special function FALLBACK can be triggered also when the calldata is not empty.

    receive() external payable {
        result = 1;
    }

    fallback() external payable {
        result = 2;
    }
}
