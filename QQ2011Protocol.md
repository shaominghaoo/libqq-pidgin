# Introduction #

I'm not really sure that this should be considered a new version of the protocol, however there are some differences between the current QQ protocol and the described QQ2010 protocol.

# Differences #

## Version string ##

The 2 byte version string at the beginning of every message has been changed to
```
0x26 0x30
```

## New message ##

A new message has been introduced that is used when AND ONLY WHEN a captcha is being sent by the server. It's sent after the server has sent image data for the captcha.

The client sends:
```
02 // beginning of message delimiter
2630 // version string
0104 // message code
1308 // seq number
868b4f1e // QQ number
0200000105010000006559 // padding?
c5d0ea605e308c7185f6ca49878a7839 // key
0f014fa384adecca3466afdd69c6abebe6e5081f8a1be2cf227f2e9549e6543fec3e0aef6fee6b09 //encrypted data
03 // end of message delimiter

Decrypted:
800012149fe200
000000000000000000000000000000
```

The server responds with:
```
02
2630
0104
1308
868b4f1e //same as above
000000 // padding
1d6a2e7bbbfeadfb12bcbd35fecc098aac78fc537c227e1f5b1e822e278456ff3e1a597c099eb915cf637e2af48da8df47f30090fdc61bec5e4626bf546dfcf405aaccaa8920471e4eaa29d1ca7d88b1fbf946c1c779c5c6120e3359e9bd2dd87a7810b33710fb23f70374cac5dc4f0a4ff3ca577b0e304946bbc695cf23751b2f66dede94a29948576fd9e0ea330c63567a959e4b72ad1334a05b6b30c327084337c6ce8220c190c083fa8db8b74424ec15f78e4ba70c6c8dbb76f979fdf3240a2982c012304ccbe34badd8c9dafcb358eed5de01750d8dec3b1dc7934c781af61b8677604afff416c2fd57134a83a19cbf238881fa3de192e8ee2dd0a8f45a243c88f4ab1bd106a549574233ceae408f4af3fca501f4c013dd71af15e19e0c5c51f88a14c3f9dccf2ed4c3c367330f7ef1cd6781d3ed60c9344d00cefe975d8b1a8b354036074a696977bd4a59052fb145151ae3e9c17c2e804c77546752b2fc3d46f902d7caf09947766cdeb91906a1842b7b2e0970cdf5b93cbc81a39a510f9322df2c50da12dcea12c9c877f066a481403b7ba83608113dfb70883c06777699957e7dc1f885d0a18ab12f875ea415f82e513721122678ade81bb176875cb4678163d938edd48e690631e7c4145087de4fa99aabf195 //encrypted message
03

Decrypted:
800012100000000000000001b601a686561647478743d51512053656375726974792043656e7465720137469746c653d537573706963696f75732049440af747874313d5468652053656375726974792043656e746572206861732064657465726d696e6564207468617420796f757220494420776173207573656420737573706963696f75736c792e20546f206b65657020796f757220494420736166652c20706c6561736520656e7465722074686520766572696669636174696f6e20636f646520746f2070726576656e74206175746f2d7369676e696e7320636175736564206279206d616c776172652e076274666f633d320b6274313d436c6f73652c32086274323d4f4b2c32016686561646c6f676f3d736869656c645f6e6f726d616c09a657863707478743d546865207369676e2d696e206164647265737320776173207573656420737573706963696f75736c792e20436c69636b206865726520746f203c5449544c453d22566965772064657461696c7320616e64207265736f6c7665207468652070726f626c656d222c55524c3d22687474703a2f2f70746c6f67696e322e71712e636f6d2f636c69656e7475726c5f333332223e3332223e0000000

```

The client then responds with its original message, and the server responds with its original message.

The server message is always the same and has parts of a URL encoded inside of it. An ascii representation of the server string is:

```
????????????????V?GG?C????6V7W&?G??6V?FW ?title=Suspicious ID??G?C??F?R?6V7W&?G??6V?FW"???2?FWFW&???VB?F??B???W"??B?v?2?W6VB?7W7??6??W6????F???VW????W"??B?6?fR????V?6R?V?FW"?F?R?fW&?f?6?F????6?FR?F???&WfV?B??WF??6?v???2?6?W6VB?'?????v?&R?v'Ff?3? ?'C??6??6R? ?'C#???? ?headlogo=shield_normal??W?7?G?C?F?R?6?v??????FG&W72?v?2?W6VB?7W7??6??W6????6??6???W&R?F???D?D?S?%f?Wr?FWF???2???B?&W6??fR?F?R??&?&?V?"?U$??&?GG?????F??v??"????6???6??V?GW&??33"#?3"#????
```

This could quite possibly be the URL to get a new captcha?