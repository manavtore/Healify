import 'package:flutter/material.dart';
import 'package:healtify/utils/assets/constants.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';


class loginpage extends StatefulWidget {
   const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  late W3MService _w3mService;
 @override
 void initState() {
   super.initState();
   initializeState();
 }
  
  Future<void> initializeState() async {
     W3MChainPresets.chains.putIfAbsent('11155111', () => _sepoliaChain);
  _w3mService = W3MService(
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
  await _w3mService.init();
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(Constant().metamask)),
                W3MConnectWalletButton(service: _w3mService),

                // W3MNetworkSelectButton(service: _w3mService),
                // W3MAccountButton(service: _w3mService)

          ],
      ),
    )
    );
  }
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