## **Introduction Project** ##
The aim of this thesis is to compare blockchain and smart contract technologies using a quantitative analysis with an applied approach, primarily focusing on two areas of research within the industry, firstly blockchain developers, investigating blockchain platforms and the trade-offs they have to consider between decentralization, scalability and security within public and private blockchains, while also comparing consensus mechanisms which make the heart of the blockchain, the project compares three consensus mechanisms (Proof of Work, Proof of Stake and Proof of SpaceTime) by testing and forming research conclusions on the benefits and limitation of the three these include environmental effects, trade-offs and ease of use. Then secondly an investigation into smart contract languages focusing on features and their readability against Solidity, Go, Daml, outlining the benefits and limitations of each which formed interesting discussions on the aspects of readability of a smart contract and how beneficial the language would be for enterprises and consumers. The comparisons were made from research findings as well as writing up an Asset transfer contract in each of the languages. In the discussion section results will be discussed with my personal findings to introduced possible findings and considerations when looking to implement blockchain and smart contract technologies.
![image](https://user-images.githubusercontent.com/61083107/142502004-d2a518b9-fa8a-44fb-9779-d240e6804dcc.png)

# **Asset Transfer Smart Contracts** #

![image](https://user-images.githubusercontent.com/61083107/142502072-7cf873a3-0e00-4726-9308-9c5b7ea9a61a.png)

Asset transfer contracts there was some changes made between each language. For example, for the Hyperledger blockchain the asset transfer didn’t require designing an appraiser and inspector as planned due to Hyperledger being private and permissioned, it was built in with the blockchain itself which would allow the organisation running the contract to manually do this off chain.

![image](https://user-images.githubusercontent.com/61083107/142501877-7f270894-2873-4dfb-8678-cf15249c7149.png)

Please follow the hyperledger fabric instructions to run the code

https://hyperledger-fabric.readthedocs.io/en/release-2.2/

Inside the hyperledger folder to access the asset transfer chaincode it will be under asset transfer basic folder
Readme inside Hyperledger folder detailing the querying and invoking commands

# **Brief outcome of comparisons** #
![image](https://user-images.githubusercontent.com/61083107/142502317-f0d0c9de-a8af-4170-834c-61c87cc5eb6d.png)



