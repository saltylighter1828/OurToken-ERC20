// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ManualToken {
    mapping(address => uint256) private sBalances;

    function name() public pure returns (string memory) {
        return "ManualToken";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether; // 100000000000000000000 wei
    }

    function decimals() public pure returns (uint8) {
        return 18; // tell everyone that it has 18 decimals - which really means totalSupply is 100 ether
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return sBalances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        // Ensure sender has enough balance
        require(sBalances[msg.sender] >= _amount, "Insufficient balance");

        // Save previous balances for invariant check
        uint256 previousBalances = sBalances[msg.sender] + sBalances[_to];

        // Update balances
        sBalances[msg.sender] -= _amount;
        sBalances[_to] += _amount;

        // Safety check: total amount between the two accounts hasn't changed
        require(sBalances[msg.sender] + sBalances[_to] == previousBalances, "Balance invariant failed");
    }
}
