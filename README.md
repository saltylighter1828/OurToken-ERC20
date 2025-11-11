🚀 OurToken (OT)






OurToken (OT) is a standard ERC-20 token built on Solidity using OpenZeppelin’s battle-tested libraries. It is designed for simplicity, security, and full ERC-20 compatibility, making it ideal for deployment on Ethereum or EVM-compatible networks.

🌟 Features

✅ ERC-20 Standard Compliant – Fully compatible with wallets, DEXs, and DeFi protocols.

✅ Initial Mint – Entire token supply is minted at deployment.

✅ Customizable Supply – You can define the initial token supply when deploying the contract.

✅ Secure & Tested – Leverages OpenZeppelin’s audited libraries.

📄 Contract Overview
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
        _mint(msg.sender, initialSupply);
    }
}

Constructor
Parameter	Type	Description
initialSupply	uint256	Total number of tokens minted at deployment. Assigned to deployer.

Token Name: OurToken

Token Symbol: OT

🚀 Deployment Example (Hardhat / JavaScript)
const { ethers } = require("hardhat");

async function main() {
  const initialSupply = ethers.utils.parseUnits("1000000", 18); // 1,000,000 OT tokens
  const Token = await ethers.getContractFactory("OurToken");
  const token = await Token.deploy(initialSupply);

  await token.deployed();
  console.log("✅ OurToken deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

🔧 Usage

After deployment, you can use all standard ERC-20 functions:

Function	Description
balanceOf(address account)	Returns the token balance of the specified address.
transfer(address recipient, uint256 amount)	Transfers tokens to another address.
approve(address spender, uint256 amount)	Approves another address to spend tokens on your behalf.
transferFrom(address sender, address recipient, uint256 amount)	Transfers tokens from an approved account.
📚 Resources & References

OpenZeppelin ERC20 Docs

Solidity 0.8 Docs

ERC20 Standard

⚖️ License

This project is licensed under the MIT License.