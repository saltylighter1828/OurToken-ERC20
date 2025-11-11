OurToken (OT)

OurToken is a simple ERC-20 token implemented in Solidity using OpenZeppelin's ERC20 library. It allows for the creation of a fixed supply of tokens that are initially assigned to the contract deployer.

Features

Fully ERC-20 compliant

Minted initial supply at deployment

Token name: OurToken

Token symbol: OT

Contract
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
        _mint(msg.sender, initialSupply);
    }
}

Constructor
constructor(uint256 initialSupply)


initialSupply: The number of tokens to mint initially, assigned to the deployer's address.

Automatically sets the token name to "OurToken" and symbol to "OT".

Deployment Example (JavaScript / Hardhat)
const { ethers } = require("hardhat");

async function main() {
  const initialSupply = ethers.utils.parseUnits("1000000", 18); // 1,000,000 OT tokens
  const Token = await ethers.getContractFactory("OurToken");
  const token = await Token.deploy(initialSupply);

  await token.deployed();
  console.log("OurToken deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

Usage

Once deployed, you can use standard ERC-20 functions:

balanceOf(address account) – Get the token balance of an address.

transfer(address recipient, uint256 amount) – Send tokens to another address.

approve(address spender, uint256 amount) – Allow another address to spend tokens on your behalf.

transferFrom(address sender, address recipient, uint256 amount) – Transfer tokens from a previously approved account.

License

This project is licensed under the MIT License.