Ignore this repo ;)

```
# Change a/main.go to firecracker or detach-test-b or anything else.

make

## This will check what happens if the parent was killed.
./check.sh

## This will check what happens if the subprocess was killed.
./rev-check.sh
```


Interesting:

* If I send a `SIGINT` with `kill`, the firecracker process does not die.
* If I press `^C` on `detach-test-a`, firecracker dies.

I think they should mean the same for `detach-test-a`.
