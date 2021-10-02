# xmrig build
deleting an existing release is only possible by also deleting the tag from your command line
Ex: git push --delete origin 6.7.1

# Use docker image
```sh
docker run -it ziggyds/xmrig --coin=monero -o stratum+tcp://pool.supportxmr.com:3333 -u 41sPsm4hpojeTa4eyctTwxLS6nVWVJtg557fhTDCPhLT8rGFShQ8NuM8EUHUxtpSeHFdenJZNcgrw4dQXvEiDvS6LyXzFwM -p docker
```