// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import "./SafeMath.sol";
contract Ownable {
    using SafeMath for uint256;
    
    address public mintAccessor;
    address public mintDest;
    address public mintAccessorChanger;
    address public mintDestChanger;
    
    event MintAccessorChanged (address indexed from, address indexed to);
    event MintDestChanged (address indexed from, address indexed to);
    event MintAccessorChangerChanged (address indexed from, address indexed to);
    event MintDestChangerChanged (address indexed from, address indexed to);
    
    /**
    * change destination of mint address
    */
    function changeMintDestAddress(address addr) public{
        require(msg.sender == mintDestChanger);
        emit MintDestChanged(mintDest, addr);
        mintDest = addr;
    }
    
    /**
    * change the mint destination changer
    */
    function changeMintDestChangerAddress(address addr) public{
        require(msg.sender == mintDestChanger);
        emit MintDestChangerChanged(mintDestChanger, addr);
        mintDestChanger = addr;
    }
    
     /**
    * change the mint accessor changer
    */
    function changeMintAccessorChanger(address addr) public{
        require(msg.sender == mintAccessorChanger);
        emit MintAccessorChangerChanged(mintAccessorChanger, addr);
        mintAccessorChanger = addr;
    }
    
     /**
    * change accessor of mint function
    */
    function changeMintAccessorAddress(address addr) public{
        require(msg.sender == mintAccessorChanger);
        emit MintAccessorChanged(mintAccessor, addr);
        mintAccessor = addr;
    }
}
