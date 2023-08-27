//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter
{
    // One - Ether Value in USD
    // USD to Ether
    function getPrice() public view returns(uint256)
    {
        AggregatorV3Interface wanted = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = wanted.latestRoundData();
        return (uint256)(answer*1e10);
    }

    //USD in terms of Wei
    function converter(uint256 _ethAmount) public view returns(uint256)
    {
        uint256 oneEth = getPrice();
        return (_ethAmount*oneEth)/1e18;
    }
}