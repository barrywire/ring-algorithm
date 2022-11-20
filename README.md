# Ring-algorithm

An implementation of the Ring Algorithm using Ruby. The ring algorithm is one of the algorithms used to determine the leader in a distributed system in a process called [Leader Election](https://en.wikipedia.org/wiki/Leader_election#Leader_election_in_rings).

## Algorithm assumptions

This implementation makes the following assumptions:

1. The nodes are connected in a logical ring.
2. Each process knows its successor.
3. Initially, all the processes know the coordinator.
4. The process id of the current process is 4.
5. The process id of the successor is obtained by adding 1 to the current process id.
