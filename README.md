# web3_fund_me
Fund Me is a decentralized crowdfunding contract written in Solidity. It allows users to send Ether to the contract, which distributes funds to designated recipients. Features include a min funding req, approved sender list, and withdrawal mechanism. Includes a simple price converter.


Fund Me is a decentralized crowdfunding contract written in Solidity for the Ethereum blockchain. It allows users to send Ether to the contract, which will then distribute the funds to a list of designated recipients. The contract has several features, including a minimum funding requirement, an approved sender list, and a mechanism for withdrawing funds.


The contract has a minimum funding requirement of 50 ETH. This means that if the total amount of Ether sent to the contract is less than 50 ETH, the contract will not distribute any funds to the recipients. This feature helps to ensure that the contract is used for meaningful fundraising efforts rather than small, insignificant transactions.

The contract maintains a list of approved senders who are allowed to send Ether to the contract. This feature helps to prevent spam or unauthorized transactions from being sent to the contract. To add a sender to the list, the owner of the contract must call the addSender function and specify the address of the sender.

The contract includes a mechanism for withdrawing funds. Once the minimum funding requirement has been met, the owner of the contract can call the withdraw function to transfer the collected funds to their own Ethereum wallet. This feature ensures that the funds raised by the campaign are accessible to the owner when they need them.

The contract includes a simple price converter that converts between Ether and US Dollars. This feature allows users to view the amount of Ether needed to meet the minimum funding requirement in US Dollar terms. The price converter uses data from Chainlink's price feed to determine the current exchange rate between Ether and US Dollars.

The contract was developed using Solidity version 0.8.0. The source code is organized into separate files for each functional component of the contract. The contract uses OpenZeppelin's ERC-20 token standard for managing the distribution of Ether to recipients.

Fund Me is a robust and flexible decentralized crowdfunding contract that allows users to raise funds for their projects or causes. Its features, such as the minimum funding requirement, approved sender list, and withdrawal mechanism, provide a secure and reliable way for users to collect and manage funds. We hope this contract serves as a useful tool for the Ethereum community and inspires further innovation in the world of decentralized finance.
