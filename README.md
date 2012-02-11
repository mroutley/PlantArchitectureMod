# PlantArchitectureMod

An L-system for modelling plant architecture.

We begin with an apex which grows through time.
As the apex grows it accumulates resources from leaves, if
the resource supply exceeds a threshold value the apex flowers.
Otherwise it produces a dormant bud and leaf. Once a bud flowers,
all lower buds are released from apical dominance. If the bud is
still viable, as determined from a random draw, the bud becomes
an apex and begins to grow. Otherwise the bud dies.

We have also implemented a random environmental disturbance
that kills the plant.
