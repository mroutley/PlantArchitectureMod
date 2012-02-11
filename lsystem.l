#include <lpfgall.h>
#include <math.h>
#include <stdio.h>
#include <time.h>

/* ======================================================= */
/* = Choose a random number from a uniform distribution  = */
/* = Eventually, we want to make this more sophisticated = */
/* ======================================================= */
#define randomize() (srand(time(0))) /* Ensures different random #s */
// #define random(x) (rand() % (x + 1) ); /* Provides a random _integer_ from 0 to x */

int random(int x)
{
	return rand() % (x+1);
}

/* =================== */
/* = Utility functions */
/* =================== */
#define outputValue(name, value) (Printf("%s:%d\n", name, value)) /* Used for printing values to the console or file */

/* ==================== */
/* = Define variables = */
/* ==================== */

/* Time */
const int steps = 30;
derivation length: steps;
int horizon; /* Time until environmental disturbance */

/* Plant characters */
const float branchingAngle = 35.0f;
const int threshold = 15; /* Resources required to produce a flower */
const int photosynthate = 1; /* Resources produced by a leaf */
const int viable= 10; /* Buds have limited viability */

/* Plant state */
int flower;

/* =========================================== */
/* = We record the number of flowers produced =*/
/* =========================================== */
FILE* fp;

Start: {
	randomize(); /* Initiate new random #s */
	horizon = random(steps); /* Random season length */
	flower=0;
	fp = fopen("output.txt", "a"); /* Append results to a file */
	outputValue("horizon", horizon);
}
StartEach: {}
EndEach: {}
End: {
	outputValue("flower", flower);
	fclose(fp);
}


/* ======================== */
/* = Define plant modules = */
/* ======================== */

module Apex(int /* time */, int /* leaves */, int /* resources */);
module Internode(int /* flower @ apex */);
module Leaf();
module Flower();
module Bud(int /* time */, int /* age */);
module DeadApex();

ignore: RollR Left Right Bud Leaf;

Axiom: SetWidth(0.1) RollL(60) Leaf() Apex(0, 1, 0);

/* =============== */
/* = Productions = */
/* =============== */
production:

Apex(t, l, r):
{
	if (t < horizon) { /* Stochastic environment */
	/* An apex produces a leaf or flower depending on resource status */
	if (r < threshold) /* Insufficient resources */
		produce
			Internode(0)
			RollR(90)
			SB() Left(branchingAngle) Bud(t, 1) Leaf() EB()
			Apex(t + 1, l + 1, r + l * photosynthate); /* Increment leaf count & accumulate resources */
	else /* Sufficient resources for flower production */
		flower++;
		produce
			Internode(1)
			Flower();
	}
	else /* Killed by environment */
		produce
			DeadApex();
}
Internode(h) > Internode(u): /* Signal propogation from tip */
{
	produce Internode(u);
}

// Leaf(): { produce Leaf(); }
// Flower(): { produce Flower(); }
Internode(u) < Bud(t, a): {
	int status = random(steps); /* Is the bud healthy? */
	if (u == 1) { /* Released from apical dominance */
		if (status < viable) { /* Unhealthy */
			produce DeadApex();
		}
		else /* Healthy */
			produce Apex(t, 1, 0);
	}
	else
		produce Bud(t+1, a+1);
}

// DeadApex(): { produce DeadApex(); }

/* ===================================== */
/* Decompositions are not used currently */
/* ===================================== */
decomposition:
maximum depth: 1;


/* ============================================= */
/* = Interpretations are pretty boring for now = */
/* ============================================= */

interpretation:

Apex(t, l, r): {
	produce SetColor(2) Sphere0();
}

Internode(flowerPresent): {
	if (flowerPresent == 1) {
		produce SetColor(1) F(1);
	}
	else
		produce F(1);
}

Leaf(): {
	produce SetColor(3) F(1);
}

Flower(): {
	produce SetColor(4) Sphere(0.25);
}

Bud(t, a): {
	produce SetColor(6) Sphere(0.25);
}

DeadApex(): {
	produce SetColor(5) Sphere(0.25);
}
