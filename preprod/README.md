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

