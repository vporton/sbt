// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.8.0;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

/// @notice Account restoration contract ("notary") controlled by NFT.
/// @author Victor Porton
contract Notary is Ownable {
    // It does not cause reentrancy vulnerability, because this function is called the last.
    function callSupervised(address _implementation, bytes memory _callData) onlyOwner public virtual payable returns(bytes memory) {
        (bool sent, bytes memory result) = _implementation.call{value: msg.value}(_callData);
        require(sent, "Failed to call");
        return result;
    }
}
