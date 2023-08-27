//SPDX-License-Identifier: MIT

/*
https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol
https://docs.chain.link/data-feeds/price-feeds/addresses
https://github.com/PatrickAlphaC/fund-me-fcc/blob/main/PriceConverter.sol
*/



pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe
{
    using PriceConverter for uint256;

    uint256 public constant MIN_FUND_USD = 50 * 1e18;

    address[] public sendersList;
    mapping(address => uint256) addressToAmount;

    address public immutable i_owner;

    constructor()
    {
        i_owner = msg.sender;
    }

    function send() public payable
    {
        require(msg.value.converter() >= MIN_FUND_USD,"Send Enough Da Paya!");
        sendersList.push(msg.sender);
        addressToAmount[msg.sender] = msg.value;
    }

    function withDraw() public 
    {
        require(msg.sender==i_owner);
        for(uint256 index = 0;index < sendersList.length;index++)
        {
            address f = sendersList[index];
            addressToAmount[f] = 0;
        }

        sendersList = new address[](0);

        payable(msg.sender).transfer(address(this).balance);

        bool re = payable(msg.sender).send(address(this).balance);
        require(re,"Send Failed");

        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call Failed");
    }

    receive() external payable 
    {
        send();
    }

    fallback() external payable 
    {
        send();
    }
}