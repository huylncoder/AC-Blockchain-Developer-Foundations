// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Welcome {
    string public greeting;
    address public  owner;

    constructor (string memory _greeting) {
        greeting = _greeting;
        owner = msg.sender;
    }

    function getGreeting() public view returns (string memory, address) {
        return (greeting, owner);
    }
}