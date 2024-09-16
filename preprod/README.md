# Atala Prism (Identus) Cardano VDR Setup

### [Video Content](https://youtu.be/8CdnCkSDm7M) 
- SSI principles
- Atala prism components
- Local setup review
- Cardano Preprod setup
  - Cardano VDR	(Verifiable Data Registry)
  - Review cardano docker file
  - Start up cardano VDR docker network
  - Show Cardano node progress
  - Show DB synch progress
  - Create wallets using Icarus
  - Transfer funds to pay for DID publishing
- Issuer Agent Setup
  - Review prism agent docker file
  - Start up Issuer docker network
  - Monitor Issuer prism agent log file
  - Monitor cardano wallet log file
  - Launch Blocktrust.dev credential builder
  - Connect to Issuer Agent
  - Create DID and publish to VDR
  - Monitor Icarus wallet for required depth of 112 blocks
  - View on Blockturst.dev analytics of DID created
- Holder Agent Setup
  - Start up Holder docker network
  - Monitor Holder prism agent log file
- Verifiable Credential
  - Create connection between Issuer and Holder
  - Issue credential from Issuer to Holder
  - Use Swagger UI to view credentials on Holder agent
  - Decode credential from base 64
  - View credential JWT

### Demo System Components
![image](https://github.com/lley154/atala-prism-setup/assets/7105016/1e921e0c-2864-4b05-81bc-191a62ffaed2)

### Environment variable files
```
.env-cardano
.env-issuer
.env-holder
```

### Script Execution
```
./cardano-start.sh
./prism-start.sh -e .env-issuer -d host.docker.internal -n issuer -p 8080 -b
./prism-start.sh -e .env-holder -d host.docker.internal -n holder -p 8090 -b
```
### Docker Images
```
$ docker images
REPOSITORY                             TAG             
hashicorp/vault                        latest          
dpage/pgadmin4                         latest          
postgres                               13              
ghcr.io/input-output-hk/prism-agent    1.28.0          
postgres                               14.10-alpine    
ghcr.io/intersectmbo/cardano-node      9.1.1           
ghcr.io/input-output-hk/prism-node     2.2.1          
swaggerapi/swagger-ui                  v5.1.0          
piotrstachyra/icarus                   v2023-04-14     
apache/apisix                          2.15.0-alpine   
ghcr.io/intersectmbo/cardano-db-sync   13.2.0.2       
cardanofoundation/cardano-wallet       2024.9.3       
```

### Reference Links
- [https://github.com/hyperledger/identus](https://github.com/hyperledger/identus)
- [https://github.com/IntersectMBO/cardano-node](https://github.com/IntersectMBO/cardano-node)
- [https://github.com/IntersectMBO/cardano-db-sync](https://github.com/IntersectMBO/cardano-db-sync)
- [https://github.com/cardano-foundation/cardano-wallet](https://github.com/cardano-foundation/cardano-wallet)
- [https://credentialbuilder.blocktrust.dev/](https://credentialbuilder.blocktrust.dev/)
- [https://analytics.blocktrust.dev/](https://analytics.blocktrust.dev/)

