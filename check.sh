#!/usr/bin/env bash


rm /tmp/firecracker.socket 2>/dev/null

./bin/detach-test-a &

echo "Sleep 1"
sleep 1

echo "Get PIPs"
aPID=$(pgrep detach-test-a)
bPID=$(pgrep firecracker)
echo "  a=${aPID}; b=${bPID}"

echo "Sleep 1"
sleep 1

echo "ps aux"
ps aux | grep "[d]eta\|[f]irec"

echo "Sleep 1"
sleep 1

echo "kill -s SIGINT ${aPID}"
kill -s SIGINT "${aPID}"

echo "Sleep 5"
sleep 5

echo "ps aux"
ps aux | grep "[d]eta\|[f]irec"

echo "kill ${bPID}"
kill "${bPID}"
