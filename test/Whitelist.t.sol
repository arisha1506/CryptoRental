// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Whitelist.sol";
import "./RandomAddress.sol";
contract WhitelistTest is RandomAddress, Test {
    Whitelist list;
    address admin;
    address user;

    function setUp() public {
        admin = randomAddress();
        user = randomAddress();
         vm.startPrank(admin);
         list = new Whitelist();
         vm.stopPrank();
    }

    function testContractCreated() public {
        assertTrue(address(list) != address(0));
    }
    function testDelegateAdminWhenAdrdressZero() public{
        vm.startPrank(admin);
        vm.expectRevert(abi.encodePacked("ADDRESS ZERO"));
        list.delegateAdmin(address(0));
        vm.stopPrank();
    }
    function testDelegateAdminDuplicate() public{
        vm.startPrank(admin);
        vm.expectRevert(abi.encodePacked("DUPLICATE"));
        list.delegateAdmin(admin);
        vm.stopPrank();
    }
    function testDelegateAdminWhenNotAdmin() public{
        vm.expectRevert(abi.encodePacked("FORBIDDEN"));
        list.delegateAdmin(randomAddress());
    }
    
    function testDelegatedAdmin() public {
        address admin_old=list.getDelegatedAdmin();
        vm.startPrank(admin);
        list.delegateAdmin(user);  
        assertEq(user, list.getDelegatedAdmin());
        assertTrue(list.inWhiteList(user));
        vm.stopPrank();  
        assertFalse(list.inWhiteList(admin_old));  
    }
   
}
