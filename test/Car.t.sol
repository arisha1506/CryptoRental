// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/RentableCar.sol";

contract CarTest is Test {
    RentableCar car;

    function setUp() public {
        car = new RentableCar("", "");
    }

    function testContractCreated() public {
        assertTrue(address(car) != address(0));
    }

    function testCarMethod() public {
        assertEq(car.getPower(), 0);
        car.setPower(1);
        assertEq(car.getPower(), 1);
    }

    function testItemMethod() public {
        assertEq(car.getOwner(), address(0));
        car.setOwner(0x7120E8DD36c32C0a323dDE5954A01c68Ab3EA1CC);
        assertEq(car.getOwner(), 0x7120E8DD36c32C0a323dDE5954A01c68Ab3EA1CC);
    }
}
