import 'package:flutter/material.dart';
import 'package:healtify/utils/assets/constants.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';


class Notifier extends ChangeNotifier {
  String _accountNo = "";
  String _balance = "";

  String get accountNo => _accountNo;
  String get balance => _balance;

    late W3MService w3mService;
  Future<void> initializeState() async {
     W3MChainPresets.chains.putIfAbsent('11155111', () => _sepoliaChain);
  w3mService = W3MService(
    projectId: 'ad97cf0cb32ec02d49278d00655f1ef5',
    metadata: const PairingMetadata(
      name: 'Healtify',
      description: 'Web3Modal Flutter Example',
      url: 'https://www.walletconnect.com/',
      icons: ['https://walletconnect.com/walletconnect-logo.png'],
      redirect: Redirect(
        native: 'Healify://',
        universal: 'https://www.walletconnect.com',
      ),
    ),
  );
  await w3mService.init();
}
 
   void updateAccountNo() {
    _accountNo =w3mService.address!;
    notifyListeners();
  }

  void updateBalance(String balance) {
    _balance = balance;
    notifyListeners();
  }

  void init() {}
}

mixin address {
}

const chainId = "11155111";

final _sepoliaChain = W3MChainInfo(
  chainName: 'Sepolia',
  namespace: 'eip155:$chainId',
  chainId: chainId,
  tokenName: 'ETH',
  rpcUrl: 'https://rpc.sepolia.org/',
  blockExplorer: W3MBlockExplorer(
    name: 'Sepolia Explorer',
    url: 'https://sepolia.etherscan.io/',
  ),
);
