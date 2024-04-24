import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import "@nomicfoundation/hardhat-ignition-ethers";

const TokenModule = buildModule("TokenModule", (m: any) => {
  const token = m.contract("HealthRecords");

  return { token };
});

export default TokenModule;