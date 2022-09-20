// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity ^0.8.0;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { BaseSBT } from "./BaseSBT.sol";

/// @author Victor Porton
contract ERC721SBT is BaseSBT, ERC721 {
    constructor(string memory name_, string memory symbol_)
        ERC721(name_, symbol_)
    { }

    // function notaryTransferFrom(
    //     address from,
    //     address to,
    //     uint256 tokenId
    // ) public virtual override {
    //     _notaryTransfer(from, to, tokenId);
    // }


    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        revert("Only the notary can transfer.");
    }

    // function _notaryTransfer(
    //     address from,
    //     address to,
    //     uint256 tokenId
    // ) onlyOwner internal virtual {
    //     require(to != address(0), "ERC721: transfer to the zero address");

    //     _beforeNotaryTokenTransfer(from, to, tokenId);

    //     // Clear approvals from the previous owner
    //     _approve(address(0), tokenId);

    //     _balances[from] -= 1;
    //     _balances[to] += 1;
    //     _owners[tokenId] = to;

    //     emit Transfer(from, to, tokenId);

    //     _afterNotaryTokenTransfer(from, to, tokenId);
    // }

    // function notaryTransfer(
    //     address from,
    //     address to,
    //     uint256 tokenId
    // ) public virtual {
    //     _notaryTransfer(from, to, tokenId);
    // }
}
