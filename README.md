# docker-mkcert

[mkcert](https://github.com/FiloSottile/mkcert) is a great tool for creating your own trusted Certificate Authority and certificates for any domain. Why not use mkcert in container?

## Usage

### Basic Usage

The container can be run with *docker run* command and create a new Root CA certificate and a single certificate for our domain list.

```sh
docker run --rm -it -v "$PWD/certs:/certs" dcagatay/mkcert example.com www.example.com *.example.com
```

If the domain list is not given, only Root CA certificate will be created.

```sh
docker run --rm -it -v "$PWD/certs:/certs" dcagatay/mkcert
```

If a Root CA certificate exists in volume-mapped `/certs` directory (`/certs/rootCA.pem` and `/certs/rootCA-key.pem`, the certificate will be created using that Root CA certificate.

### Advanced Usage

The owner of the created certificates is *root* user by default. If you want to change the ownership of the certificates you can provide `UID` and `GID` environment variables to the command.

```sh
docker run --rm -it -e "UID=1000" -e "GID=1000" -v "$PWD/certs:/certs" dcagatay/mkcert example.com www.example.com *.example.com
```

## Credits
- [FiloSottile/mkcert](https://github.com/FiloSottile/mkcert)
- Inspired by [vishnudxb/docker-mkcert](https://github.com/vishnudxb/docker-mkcert)
