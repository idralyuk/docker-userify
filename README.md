# docker-userify

### Running the Docker image as a Container

```bash
docker run -i --rm -p 2222:2222 -v /var/run/docker.sock:/var/run/docker.sock \
--env USERIFY_COMPANY=FooBar \
--env USERIFY_PROJECT=baz \
--env USERIFY_API_ID="xyz_user" \
--env USERIFY_API_KEY="ABCDEFGH" \
-t idralyuk/docker-userify /sbin/my_init -- /bin/bash
```
