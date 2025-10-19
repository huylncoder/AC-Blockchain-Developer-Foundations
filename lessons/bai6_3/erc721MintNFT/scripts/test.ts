import { ethers } from "ethers";
import * as dotenv from "dotenv";

dotenv.config();


async function main() {
  const provider = new ethers.JsonRpcProvider("https://eth-sepolia.public.blastapi.io");

  const privateKey = process.env.TESTNET_PRIVATE_KEY!;
  const wallet = new ethers.Wallet(privateKey, provider);

  const abi = [
    "function mint(address to) external",
    "function ownerOf(uint256 tokenId) view returns (address)"
  ];
  const contractAddress = "0x74B92e1CE9c6fC97820ddDD183cd664908675C31"; 
  const contract = new ethers.Contract(contractAddress, abi, wallet);

  console.log("Minting NFT to:", wallet.address);
  const tx = await contract.mint(wallet.address);
  await tx.wait();
  console.log("Transaction hash:", tx.hash);

  const tokenId = 1;
  const owner = await contract.ownerOf(tokenId);
  console.log(`Owner of token ${tokenId}:`, owner);
}

main().catch(console.error);