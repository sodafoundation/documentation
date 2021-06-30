---
title: Access Key, Secret Key.
description: This document describes how to generate Access Key and Secret Key (AK/SK) using APIs.
weight: 20
---
This document describes how to generate Access Key and Secret Key (AK/SK) using APIs. The AK/SK can be used to authenticate with SODA Identity Service for executing any other APIs in SODA, thereafter.

##### AK: access key ID, which is a unique identifier used in conjunction with a secret access key to sign requests cryptographically.
  
##### SK: secret access key used in conjunction with an AK to sign requests cryptographically. It identifies a request sender and prevents the request from being modified.

{{% notice info %}}
**_To use the multicloud service, an Access Key, Secret Key (AK/SK) must be generated before anything else. To do this you can follow the steps below:_**  <br />
Assuming that the user have access to cURL, the API execution is displayed using cURL commands.
{{% /notice %}}


#### 1. Create the Token for the "admin" User.
API URI Format : 'http://"HOST_IP"/identity/v3/auth/tokens'
                 where HOST_IP is the IP address of the host where Keystone is running. 

```bash
curl --location --request POST 'http://192.168.xx.yy/identity/v3/auth/tokens' \
--header 'Content-Type: application/json' \
--data-raw '{
  "auth": {
    "identity": {
      "methods": [
        "password"
      ],
      "password": {
        "user": {
          "name": "admin",
          "domain": {
            "name": "Default"
          },
          "password": "password"
        }
      }
    }
  }
}'
```

Similarly, tokens can be generated for any of the users. To generate token for any specific user, replace the "name": "admin" with the <user-name> of the "user" and the user's corresponding password. 

#### 2. Generate the Scoped Tokens 
API URI Format : 'http://<HOST_IP>/identity/v3/auth/tokens'
                  where HOST_IP is the IP address of the host where Keystone is running. 
  ```bash
  curl --location --request POST 'http://192.168.xx.yy/identity/v3/auth/tokens' \
  --header 'X-Auth-Token: gAAAAABg1Ybtbnk2NEbyewe_mOILyo5v0PnaTWGoSyMhq75NaWR_L111111111111111111111_I222222222_M3333333333_ICZUHCIDLtU0pIcKGAvN9zJKXaXBQQIf27a3uq2WM8eQroQ-CMc1-riHbCbrs_iFucc2Z4RCGEzxL6YqTvlzBoarjIsx5' \
  --header 'Content-Type: application/json' \
  --data-raw '{
    "auth": {
      "identity": {
        "methods": [
          "token"
        ],
        "token": {
          "id": "gAAAAABg1Ybtbnk2NEbyewe_mOILyo5v0PnaTWGoSyMhq75NaWR_L111111111111111111111_I222222222_M3333333333_ICZUHCIDLtU0pIcKGAvN9zJKXaXBQQIf27a3uq2WM8eQroQ-CMc1-riHbCbrs_iFucc2Z4RCGEzxL6YqTvlzBoarjIsx5"
        }
      },
      "scope": {
        "project": {
          "name": "admin",
          "domain": {
            "id": "default"
          }
        }
      }
    }
  }'
  ```

Generate the Scoped Tokens for the user. Here, the scoped token for the "admin" user is generated, using the tokens obtained in the Response Header "X-Subject-Token" from Step 1. 

#### 3. Using the token AK/ SK can be generated using the POST API 

  After the Scoped Tokens are generated, ProjectID and UserID can be obtained from them. ProjectID is same as the tenant_id used in the other SODA APIs.
  For eg, if the ProjectID and UserID obtained are 

  ```bash
    project_id : "94b280022d0c4401bcf3b0ea858777777" 
    user_id : "555557c4256555bd8a307c374644444" 
  ```

  then the command would look like this. 

  API URI Format : 'http://<HOST_IP>:<PORT>/v1/<project_id>/aksks'
                    where HOST_IP is the IP address of the host where Keystone is running.
                    PORT is the port where SODA Multicloud service is listening eg. 8089
                    project_id is the Id of Project that the user is part of. It is same as the tenant_id.
 
  BODY Format :
  ```bash
  '{
      "credential": {
          "project_id": <PROJECT_ID>,
          "user_id": <USER_ID>
      }
  }'
  ```
{{% notice info %}}
**_Please make sure that the project_id and user_id are valid and exist before creating the AK / SK for them_**  <br />
{{% /notice %}}

  ```bash
  curl --location --request POST 'http://192.168.xx.yy:8089/v1/94b280022d0c4401bcf3b0ea858777777/aksks' \
  --header 'X-Auth-Token: gAAAAABg1Ybtbnk2NEbyewe_mOILyo5v0PnaTWGoSyMhq75NaWR_L111111111111111111111_I222222222_M3333333333_ICZUHCIDLtU0pIcKGAvN9zJKXaXBQQIf27a3uq2WM8eQroQ-CMc1-riHbCbrs_iFucc2Z4RCGEzxL6YqTvlzBoarjIsx5' \
  --header 'Content-Type: application/json' \
  --data-raw '{
      "credential": {
          "project_id": "94b280022d0c4401bcf3b0ea858777777",
          "user_id": "555557c4256555bd8a307c374644444"
      }
  }'

  ```

 Upon execution of the POST API, the AK/SK would be generated in string format. For example the generated AK/SK would look like 
```bash
{
    "access_key": "l4ayVHYQ4TKFTLPW",
    "secret_key": "RymTqjJUyBZJq6LzlYZgck1e2m4gSloc"
}
```
The AK/SK should be used any further API calls to SODA.


#### 4.  Get the AK/SK of a particular user. 

To get the AK/SK of a particular user, execute the GET API of AK/SK using the cURL command

  ```bash
  curl --location --request GET 'http://192.168.xx.yy:8089/v1/94b280022d0c4401bcf3b0ea858777777/aksks/555557c4256555bd8a307c374644444' \
  --header 'X-Auth-Token: gAAAAABg1Ybtbnk2NEbyewe_mOILyo5v0PnaTWGoSyMhq75NaWR_L111111111111111111111_I222222222_M3333333333_ICZUHCIDLtU0pIcKGAvN9zJKXaXBQQIf27a3uq2WM8eQroQ-CMc1-riHbCbrs_iFucc2Z4RCGEzxL6YqTvlzBoarjIsx5' \
  --data-raw ''
  ```

#### 5.  Download the AK/SK of a particular user. 

  To download the AK/SK of a particular user, execute the GET API of AK/SK using the cURL command with the -output=<file> option.

  ```bash
  curl --location --request GET 'http://192.168.xx.yy:8089/v1/94b280022d0c4401bcf3b0ea858777777/aksks/555557c4256555bd8a307c374644444' \
  --header 'X-Auth-Token: gAAAAABg1Ybtbnk2NEbyewe_mOILyo5v0PnaTWGoSyMhq75NaWR_L111111111111111111111_I222222222_M3333333333_ICZUHCIDLtU0pIcKGAvN9zJKXaXBQQIf27a3uq2WM8eQroQ-CMc1-riHbCbrs_iFucc2Z4RCGEzxL6YqTvlzBoarjIsx5' \
  --data-raw '' --output <filename>
  ```


#### 6. Delete AK/SK of user. 

  To delete the AK/SKs of a user, execute the DELETE API of AK/SK using the cURL command.

  ```bash
  curl --location --request DELETE 'http://192.168.xx.yy:8089/v1/94b280022d0c4401bcf3b0ea858777777/aksks/555557c4256555bd8a307c374644444' \
  --header 'X-Auth-Token: gAAAAABg1Ybtbnk2NEbyewe_mOILyo5v0PnaTWGoSyMhq75NaWR_L111111111111111111111_I222222222_M3333333333_ICZUHCIDLtU0pIcKGAvN9zJKXaXBQQIf27a3uq2WM8eQroQ-CMc1-riHbCbrs_iFucc2Z4RCGEzxL6YqTvlzBoarjIsx5'' \
  --data-raw ''
  
  ```

 More details about the Keystone Credential APIs can be found [here](https://docs.openstack.org/api-ref/identity/v3/index.html?expanded=create-credential-detail,delete-credential-detail,update-credential-detail#credentials).