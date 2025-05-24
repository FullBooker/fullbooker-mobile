# Deployment docs

## Create a signing key

All apps sent to Firebase and Google Play Console must be signed with a release key

Run the following command

```sh
keytool -genkey -v -keystore fullbooker.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 5000 -alias fullbooker
```

In the above command, `fullbooker.jks` is the name of the key, validity is `5000 days` for now

## Add signing configs to key.properties file

After generating the above key, add it to your `key.properties` file replacing it with the correct values

```sh
storePassword=<store-pass>
keyPassword=<key-pass>
keyAlias=<key-alias>
storeFile=<store-file-path>
```

## List the SHA256 of a generated release key

```sh
keytool -list -v -keystore "my_release_keystore.jks" -alias "release_key" -storepass "my_store_password" -keypass "my_key_password"
```

## Creating Github secrets

Most of the secrets on GitHub are base64 encoded. Encode your env variables using this (on MacOS)

```sh
base64 -i android/app/src/dev/google-services.json | tr -d '\n' | pbcopy
```
