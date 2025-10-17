import { ethers } from "ethers";

async function main() {
  const provider = new ethers.JsonRpcProvider("https://eth-sepolia.public.blastapi.io");

  const abi = [
  "function balanceOf(address owner) public view returns (uint)",
  ];
  const contractAddress = "0xEC17d414e7B72c65689C1D5AE3059A10e8fAD885"; 

  const contract = new ethers.Contract(contractAddress, abi, provider);

  const deployerAddress = "0x040a0296c63715C039c107aC1Fe4faA720EE707f";

  const balance = await contract.balanceOf(deployerAddress);
  console.log("Balance of deployer:", ethers.formatEther(balance), "MTK");
}

main().catch(console.error);