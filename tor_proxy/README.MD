### Usage Instructions

```bash
docker build -t tor_proxy-socks -f Dockerfile .
docker run -d --rm --name tor_proxy -p 9150:9150 tor_proxy-socks
```

### Check Connection

```bash
curl -x socks5://localhost:9150 -k https://check.torproject.org/
```