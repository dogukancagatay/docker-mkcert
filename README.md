# docker-mkcert

[mkcert](https://github.com/FiloSottile/mkcert) is a great tool for creating your own trusted Certificate Authority and certificates for any domain. Why not use mkcert in container?

## Usage

### Basic Usage

The container can be run with *docker run* command and create a new Root CA certificate and a single certificate for our domain list.

```sh
docker run --rm -it -v "$PWD/certs:/certs" dcagatay/mkcert example.com www.example.com '*.example.com'
```

Note: The single quotes around '*.example.com' are necessary to prevent the shell from prematurely expanding the wildcard character.

If the domain list is not given, only Root CA certificate will be created.

```sh
docker run --rm -it -v "$PWD/certs:/certs" dcagatay/mkcert
```

If a Root CA certificate exists `/certs/ca` directory (`/certs/ca/rootCA.pem` and `/certs/ca/rootCA-key.pem`, the certificate will be created using that Root CA certificate.

### Advanced Usage

The owner of the created certificates is *root* user by default. If you want to change the ownership of the certificates you can provide `PUID` and `PGID` environment variables to the command.

```sh
docker run --rm -it -e "PUID=$(id -u)" -e "PGID=$(id -g)" -v "$PWD/certs:/certs" dcagatay/mkcert example.com www.example.com '*.example.com'
```

## Building Image Locally

```sh
docker buildx build -t dcagatay/mkcert:latest .
```

## Changelog

- In the version `v1.4.4`;
  - The root certificate directory was moved to `/certs/ca` from `/certs`, If you were using a previous version you need to move your `rootCA.pem` and `rootCA-key.pem` files under `/certs/ca`.
  - The user id and group id variables, `UID` and `GID`, are renamed to `PUID` and `PUID`.

## Credits

- [FiloSottile/mkcert](https://github.com/FiloSottile/mkcert)
- Inspired by [vishnudxb/docker-mkcert](https://github.com/vishnudxb/docker-mkcert)
