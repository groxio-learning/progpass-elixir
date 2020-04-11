# LifeStream

Conway's Game of Life is played on a grid with cells. Each cell has a state of either live or dead. The computer will use the grid of cells to compute successive generations based on the following rules: 

- Each cell has a count. The cell's count is the number of  other "touching" live cells, including diagonals. In the following diagram,  `+` characters are live and `.` characters are dead. Cell C has a three live neighbors, one above, one to the right, and one on the lower left. Therefore, it has a count of three: 

```
..+..
..C+.
.+...
```

- In the next generation, if a cell has a count less than two, it will be dead from loneliness. 
- In the next generation, if a cell has a count of exactly three, it will be alive.
- In the next generation, if a cell has a count of two, it will stay the same, either live or dead.
- In the next generation, if a cell has a count greater than three, it will be dead from overcrowding.

The following diagram shows an initial Life game board: 

```
.....
.+++.
.....
```

We can compute the next generation, based on the rules of the game: 

```
..+..
..+..
..+..
```

And the next: 

```
.....
.+++.
.....
```

This code will implement the game of Life with each next generation in a Stream. 

## Subscribe to [grox.io](grox.io) for a test-first project to build this game, step by step. 

