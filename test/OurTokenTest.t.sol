// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "lib/forge-std/src/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }

    function testAllowancesWorks() public {
        //ERC20 has a important function called transferFrom
        uint256 initialAllowance = 1000;

        //Bob approves Alice to spend tokens on her behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount); //you can set bob as from
        //ourToken.transfer(alice, transferAmount); if I do just transfer, automatically sets the from as whoever is calling the function
        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }
    /* -------------------- EDGE CASES -------------------- */

    function testTransferToZeroAddressShouldRevert() public {
        vm.prank(alice);
        vm.expectRevert();
        ourToken.transfer(address(0), 1 ether);
    }

    function testApproveZeroAddressShouldRevert() public {
        vm.prank(alice);
        vm.expectRevert();
        ourToken.approve(address(0), 10 ether);
    }
    /* -------------------- BASIC TESTS -------------------- */

    function testInitialSupply() public {
        assertEq(ourToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }
}
