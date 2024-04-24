import { HardhatUserConfig } from 'hardhat/config';
import * as dotenv from 'dotenv';
import "@nomicfoundation/hardhat-ignition-ethers";

dotenv.config(); // This loads the environment variables from .env file into process.env

const API_KEY: string = process.env.API_KEY!;
const Metamask_private_key: string = process.env.METAMASK_PRIVATE_KEY!;

const config: HardhatUserConfig = {
  solidity: "0.8.24",

  networks: {
    sepolia: {
      url: API_KEY,
      accounts: [Metamask_private_key]
    }
  }
};

export default config;