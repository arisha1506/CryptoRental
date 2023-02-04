//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import "./RentableFlat.sol";
import "./RentableCar.sol";
import "./RentableItem.sol";
import "./Whitelist.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ItemManager{
    RentableItem[] private rentableItems;
    Whitelist list;
    function startRent(uint256 id) external returns(bool){
    }
    function stopRent(uint256 id) external returns(bool) {}
    function myItems() external view returns(uint256[] memory) {}
}
