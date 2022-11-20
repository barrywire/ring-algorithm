# Ring-algorithm

An implementation of the Ring Algorithm using Ruby. The ring algorithm is one of the algorithms used to determine the leader in a distributed system in a process called [Leader Election](https://en.wikipedia.org/wiki/Leader_election#Leader_election_in_rings).

## Algorithm assumptions

- This implementation assumes that the nodes are connected in a logical ring.
- This implementation assumes that each process knows its successor.
