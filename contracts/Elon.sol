pragma solidity ^0.8.0;
 
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
 
 // NFT - ERC 721 token standard

 // what attributes and functionalities do these NFTs have?

contract ElonNFT is ERC721URIStorage {
    // keep counter of number of contracts we are minting
    // each NFT is unique
   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds;
 
   constructor() ERC721("ElonMusk", "ELON") {}
 
   function mintNFT()
       public
       returns (uint256)
       {
           _tokenIds.increment();
           uint256 newItemId = _tokenIds.current();
           _mint(msg.sender, newItemId);
           // https://jsonkeeper.com/
           // https://app.pinata.cloud/ to host images decentralized manner
           _setTokenURI(newItemId, "https://jsonkeeper.com/b/MHPK");
           console.log("The NFT ID %s has been minted to %s", newItemId, msg.sender);
           return newItemId;
       }
}

// dev net - hardhat, local BC environment, simple, fast
// test net - simulation of live ethereum env
// mainnet - real $$ to push 