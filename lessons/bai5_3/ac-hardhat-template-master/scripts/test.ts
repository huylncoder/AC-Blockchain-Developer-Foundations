import { ethers } from "ethers";

async function main() {
  const provider = new ethers.JsonRpcProvider("https://eth-sepolia.public.blastapi.io");

  const abi = [
  "function getCount() public view returns (uint)",
  "function increment() public"
  ];
  const contractAddress = "0x5a82478A5Cd05180D61347D3ed85055634B0351A"; 

  const contract = new ethers.Contract(contractAddress, abi, provider);

  const count = await contract.getCount();
  console.log("Current count is:", count.toString());
}

main().catch(console.error);