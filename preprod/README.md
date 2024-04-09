# Atala Prism Cardano VDR Setup

### Video Content
- SSI principles
- Atala prism components
- Local setup review
- Cardano Preprod setup
  - Cardano VDR	
  - Review cardano docker file
  - Start up cardano VDR docker network
  - Show Cardano node progress
  - Show DB synch progress
  - Create wallets using Icarus
  - Transfer funds to pay for DID publishing
- Issuer Agent Setup
  - Review prism agent docket file
  - Startup up Issuer docker network
  - Monitor Issuer prism agent log file
  - Monitor cardano wallet log file
  - Launch Blocktrust.dev credential builder
  - Connect to Issuer agent
  - Create DID and publish
  - Monitor Icarus wallet for required depth of 112 blocks
  - View on Blockturst.dev analytics of DID created
- Holder Agent Setup
  - Startup up Holder docker network
  - Monitor Holder prism agent log file
- Verifiable Credential
  - Create connection between Issuer and Holder
  - Issue credential from Issuer to Holder
  - Use Swagger UI to view credentials on Holder agent
  - Decode credential from base 64
  - View credential JWT


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
lawrence@lawrence-iMac:~/src/atala-prism-setup$ docker images
REPOSITORY                             TAG             IMAGE ID       CREATED         SIZE
hashicorp/vault                        latest          3b58e3e77ac1   6 days ago      430MB
dpage/pgadmin4                         latest          f3e7a186b202   8 days ago      476MB
postgres                               13              745f408317c8   6 weeks ago     419MB
ghcr.io/input-output-hk/prism-agent    1.28.0          bfdc74d8db96   7 weeks ago     712MB
postgres                               14.10-alpine    85aaba968066   3 months ago    239MB
ghcr.io/intersectmbo/cardano-node      8.7.3           e472e2321fe3   6 months ago    911MB
ghcr.io/input-output-hk/prism-agent    1.16.0          6b9340211a6e   6 months ago    865MB
ghcr.io/input-output-hk/prism-node     2.2.1           81ed397df399   8 months ago    784MB
swaggerapi/swagger-ui                  v5.1.0          2704906c4572   9 months ago    105MB
piotrstachyra/icarus                   v2023-04-14     7daf5a1d5e9d   11 months ago   299MB
apache/apisix                          2.15.0-alpine   7d2986d15386   20 months ago   145MB
ghcr.io/intersectmbo/cardano-db-sync   13.2.0.1        b3edd35e9ddc   54 years ago    1.48GB
cardanofoundation/cardano-wallet       2024.3.27       06944a4785b2   54 years ago    1.24GB
```
